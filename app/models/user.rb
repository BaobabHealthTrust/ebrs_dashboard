require 'couchrest_model'

class User < CouchRest::Model::Base

  use_database "local"

  def username
    self['_id']
  end

  def username=(value)
    self['_id'] = value
  end

  property :first_name, String
  property :last_name, String
  property :password_hash, String
  property :email, String
  property :active, TrueClass, :default => true
  property :notify, TrueClass, :default => false
  property :role, String
  property :site_code, String
  property :creator, String
  property :created_at, String
  property :updated_at, String
  # property :password_hashed_already, TrueClass, :default => false
  property :plain_password, String
  property :un_or_block_reason, String
  property :_rev, String

  timestamps!

  cattr_accessor :current_user

  def has_role?(role_name)
    self.current_user.role == role_name ? true : false
  end

  design do
    view :by_active

    # active views
    view :active_users,
         :map => "function(doc){
            if (doc['type'] == 'User' && doc['active'] == true){
              emit(doc._id, {username: doc._id ,first_name: doc.first_name,
              last_name: doc.last_name, email: doc.email,role: doc.role,
              creator: doc.creator, notify: doc.notify, updated_at: doc.updated_at});
            }
          }"

  end

  design do
    view :by_username,
         :map => "function(doc) {
                  if ((doc['type'] == 'User')) {
                    emit(doc['_id'], 1);
                  }
                }"
  end

  before_save do |pass|
    self.password_hash = BCrypt::Password.create(self.plain_password) if not self.plain_password.blank?

    self.plain_password = nil

    self.creator = 'admin' if self.creator.blank?
  end

  def password_matches?(plain_password)
    not plain_password.nil? and self.password == plain_password
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  rescue BCrypt::Errors::InvalidHash
    Rails.logger.error "The password_hash attribute of User[#{self.username}] does not contain a valid BCrypt Hash."
    return nil
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.create(params)
    user = User.new()
    user.username = params[:user]['username']
    user.plain_password = params[:user]['password']
    user.first_name = params[:user]['first_name']
    user.last_name = params[:user]['last_name']
    user.role = params[:user]['role']
    user.site_code = Site.current_code
    user.email = params[:user]['email']
    user.save
    return user
  end

  def self.edit(params)
    if params[:edit_action] == 'password_only'
      cur_user = User.current
      cur_user.plain_password = params[:user]['password']
      cur_user.save
    elsif params[:edit_action] == 'edit'
      cur_user = Utils::UserUtil.get_active_user(params[:username])
      cur_user.first_name = params[:user]['first_name']
      cur_user.last_name = params[:user]['last_name']
      cur_user.role = params[:user]['role']
      cur_user.email = params[:user]['email']
      cur_user.save
    end

    true
  end

  def self.get_active_user(username)
    user_hash = User.active_users.keys [username]
    return if user_hash.blank?
    username = user_hash.rows.first['value']['username']
    User.find username
  end

  def confirm_password
    password_hash
  end

end
