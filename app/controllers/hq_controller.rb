class HqController < ApplicationController

  http_basic_authenticate_with :name => CONFIG["print_user"], :password => CONFIG["print_password"], :only => [:birth_certificate]

  before_filter :check_if_user_admin

  def re_open_case

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @section = "Re-Open Case"

    @targeturl = "/"

    render :layout => "facility"

  end

  def close_cases

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @section = "Close Case"

    @targeturl = "/"

    render :layout => "facility"

  end

  def void_cases

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @section = "Void Cases"

    @targeturl = "/"

    render :layout => "facility"

  end

  def view_cases

    @section = "View Cases"

    @targeturl = "/"

    render :layout => "facility"

  end

  def view_closed_cases

    @section = "View Closed Cases"

    @targeturl = "/"

    render :layout => "facility"

  end

  def view_requests

    @section = "View Requests"

    @targeturl = "/"

    render :layout => "facility"

  end

  def manage_duplicates

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @section = "Manage Duplicates"

    @targeturl = "/"

    render :layout => "facility"

  end

  def reports

    @section = "Reports"

    @targeturl = "/"

    render :layout => "facility"

  end

  def print_certificates

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @section = "Print Birth Certificates"

    @targeturl = "/"

    render :layout => "facility"

  end

  def list_voided_cases

    @section = "List Voided Cases"

    @targeturl = "/"

    render :layout => "facility"

  end

  def manage_sites

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @section = "Manage Sites"

    @targeturl = "/"

    render :layout => "facility"

  end

  def index

    @icoFolder = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAgAElEQVR4nOy9Z3SjeXbe2dZ617s+9lmf0a53nfbDruwNXq99JK/V0gT1zGiCRpoka6RRlrp7qruripVzZALAnBNIgjlngjnnnDMJEoEAAYIgwFys2PXbD2/AC5BV3V0labznzHvO/xxWdVU1yOe593/Dc+/7zju/eH7x/OL5xfOL5xfPL55fPL94/ot9IgLP/s/R4Re+GR155XZs9PWihPhbBfm5ITe7ulL/75/3Z/vF8zf8BAQE/IModcD/Fa4J+NNwTUBimCpgKEwVsBsVcYmkxBvk5QRSVxNJV3siPR3JT8YGtWd+3p/5F89bPIGBZ/6HiIiAr0ZoLl4OUweUatTnVzTqC8+jIy+TlnyTwvwgGvWRDPQkMz2uY3Emh+W5XBZnclmYzmZ8OP1RS0v0v/p5fx9/Z09g4Jl/GBFx6T9ERVz6MCbqqjYm6mp9YsLN3PTUBz+r1YX/45/353vdc+bMmf9arT73b8LCLvxhmOZCjEZ1vlejCtiOCLtIfOxVdBl3qSxT09ESx9hQOgvT2azM52KYy2V5Lo+FmRzmp7KZn8pmbjKbucksZieyGO/Xfv3n/b39rT2RgR//00jN+W9EhF28Fa4OqFaHnjdp1OdfRkdeJj31NuUlajrbEhns09LekjA+M5P6T3/en1l6AgMv/ZPw8IB3w8Mvng9XBxRoVAELYeqAJ1ERl0hJuklBbiD1tZH0dyczM65jeS6P1YV8AfCpTObGtIyNZjE8WcDspI65ySzmp7JZmMpiaVrH3ISO2QkdM6OZ3/x5f69/I09g4Ht/PyLiwr+OlC0koF8det4Tpr5AbPQVMrV3qSrX0NORxNxkDlZjKe7NGva269i2V2M2FLMyV6D++Xz2d35Jo/nkfw1XX/pRRNgFTZjqQrtGfX4zXHOBuJgrZGrvUF4SSntzHGODWhZncjEsFLC6WIhhPpflaR0LY1omR9LpG82naUpP2dIA2ZYVSlZGmB5KZmZMy+xYGoP9WupaMhkZymRmPJOJkYxv/Dy+57d+AgPP/qMozYVfC9dc+DhCczFXowqY06gCnkSEXSAh7hq5WQ+oq45gqDeV5bl8HOuV7Lrq2HfX47RVMT2WSXlxILeu/xkP7v41dksF68aStr+Lzx4e/v4/jtJc+LXIsICPwjQB2RpVwEyYOuA4MuISSQk3yMt+iL46gr4u4e5emc9nbamQtaVCVhfyWZnJYnE8nZnRdEZGs+mYrKB6oZMC4zQ6q5F0u420jQ1SNuwkTgyTmh1JZHYKfxxazG/dqOY/XamhoUXL7Hj6/38IEB5+/p9HaAK+HRl+4X6YJqBeHXreqlEFEBl+iZTEGxTmB9HSEMP4cAbG5SJc9mr23Q3sb9djM5Ux2JOELv0Gly/+ET/+4Tf49re/wR/99I958CCEttZqNsxlWFZLOv82PntY2MX/JTIs4HfDNRcCw1QBjerQ89YwjeCZ0tNuU1oUQmtTLKOD6SzO5LG6WIhxqYi1pUIM8/mszGazNJXJ/JiWidFMeieKaZhrpmR1lByrgQy7Fa3DTurGBklmMymri2QtD1K1WEvzZCr9I0Fk6SP4F39dzb/5pI5fvViNvj6RiaFURgZS/8sjgBDwnP8/IsMu/kmkJiAxTH1hWKM6vxemDiAmSrq/VXS2JTAzkYXVWIrHqefQ08DOlp7VxQJaG6OIjQrgZx/8kO/9znt873e+ywcf/Iy4uER6evvZ2dnF+xxgWS1ifa2s420/e2DgmX8YFhbw7yM0Ae+Hay5ow1TnJ9Sh5w8jwy+SGH+dnKwH6KvC6etKYmYii9XFAsyGYsyGYozLRRgWClmZy2NpKouFcS3To+kMjuXROl1L5Uo/BZYFsh3rZDgdpDkcpKzbSDGukmmYomSpjZbFAkYXY1hcCsSwdAfDym3WDLepqAvk3TM5/MrPKvi3HxdRVBRKf2ccPR2JP38ChIWd+e8j1Rd/PTL84vmIsAuFGtX5JY3q/DPhDrxKVsY9aivD6e9OYXEmD7ulgl1XHQeeBlz2amYnsqgsDSbowfv8yR9/l+98+z1+8IMfcPHiFXJy8pmemeXZs2con4ODA7a3twF4cryF1ViMda2s64t+dpXqzD+L1AT8dkTYxTthmoAadeh5k0YV8GlM1GXSUm5RUhhMS2MMo4PpLM3mY1opZn2tBMtqCaaVItaWClhdzMcwl8PyZCazo+mMjWXTNVmOfqGdYtM0OQ4Tui0HGU4naRt2Ui0WtGsL5K/0U7dUycBSKvMralZX7rO6cpvFxdtMTd5huPc+vbXBtGWraYsLJ/x2FP/7X+n4gwflNDYW0NIQTUuj5u+eAMnRV/5VbOy1342OvBIcEXahJUx93q5RBRARfpGkhOvk5zykQR/FyIAWw2IhW7Yq9rfr2duuZ8NUxlBfCtkZt7h6+af8+EffFNz5H/2UBw+CqKmpw2JZx/9xOBz09PSwvLzM48ePCQ8PZ3BwEIDHj5wCAUyli4GBgb/0qs8dEBDwD8LCzv3byLCLfxahDkjSqM8Pq0MDdiPCLpAQe43szPvUVIbT25nE7EQ2a8tFrK+VYjWWioAXy659dT4Pw0wWixMZTI1lMjBZRPNcE5WroxRsGMjespPpcpK+uUmazYbWvEq2YZzK5Ua6lrOZXonCYAjEaLiLYeU2c3N3GBu+R39zIB2FoTQmatBHRFEXmURzWjZ9FdUMdPTQPzrD2uoqi4tLlBdrqCoL/LsjQHZ2yPd06Q87UpJuH8TFXCc+9jra1NuUFIbQ1hTL5EgmppVitu3V7Lvr8Tj1rC0J7jwuOoAzH/6I3/3ee/zO73yH99//kNjYBHp7B3C5tn3APj4+xmAwMDExgU6no7q6mujoaJKSkigvL6evrw+1Wo3ZbOblSzg+2sRmLGHDWP7caiz+j9LnVasD/seIiIDfCtdcvBqmDijXhAYY1KEBz6MiLpGadJOigmBaGgTrXpnPZ32tlA1zORumctbXSjEbRNCXizAuFbA6l8PSZAYzo+kMjebSPl1NzUo/xbYl8rZs5Li30Lm2SHc40FrN6ExzlBi6aVkpZWwlkWWDCtPqfYyrd1lausPU5D2GOx/QXR5ES5qa+ugoGmKSaE3Ppa9Sz0RvP4uzcxhWV1k1GlkxGFhcmGNqaorBwQEytffISLnyrvT9Bgb+5L/5yU9+8l/9rYCfowu5mperRpcZTFlxGL2dycxP5WBdK8O9Wcvedh1OWxUzEzqvO//pd/nOt3+L73//+1y4cJmsrFymp2d59uz5CQs/Pj6moaGB+vp6YmJiKC0tRaVSceXKFSIiItDpdLS0tGA0Gn3+3qcvYcu5xoaxFIe5AstK8VhCzNWIkKCzfZrQc9vSNaTLuEd1RRi9nUIaaTaUYLdU4FivxG4px2oslV27ZbWYdUMRpsVcVqYzmR7RMjSUScdYCXUL7ZSZZyjcWidvx0WOx41u20WGfYNMi4FC4wj1q3oGDZksrEZiWgvCtHaPlZW7zM7eY3TgPr36h7Rlh9KYEEFjXDLtGfkMVNUz1T/I8vwCa0Yja2YzK6urzC8sMD09zfj4OMPDIwwMDNLT00dTUyNREZeIDD8fGBV2URUZcakrJvLqckLszdm01HvlZcXqP/gbA1+rffD1bF0w2boQOlqTcNqq2NnSs75WymBPMlkZN7lySYjOv/Wt9/jJT/6Qu3cfUlVVi9lsOQG21WplZmaG9vZ2wsPDaW1txWq1EhoailqtJioqiurqalpbWxkZGeHly5dewD/9FLPZQmNjC6GhYfz+7/8RF87/Bdsb1djNFTgslUwMZ1JXE0lzfTRjg+kYFgrYMJfjtFXitFXiWK/AZirHaizDaixlw1iC3ViIdSWP5Wkdw/0ZNLXrKO8oonCoiYLFMQrsRvI9LnL3dsje8aDb2kJnXyd/fZZqYwc9a0XMrCVgNIaybnqAce0ei4v3mBy7x0DLfdoLg2hKDacpMYmOzAKGqhuZGRhmZWERk9mM0WLBsLbG4uIiMzMzTExMMjo6xtDQCL29/bS1taHXV1FclEVGehRxMXfQqAIIl7ORO5QUhtBUH0V3ewIdLfG01Mdo33nnnb/31gRITrrdlJZyjwZ9LGZDMckJl/nw/R/wO9/9Gt/5zrf4q796n6ioWLq6enF7dnzAPjw8ZGVlhZmZGaqrqykqKuL69eucO3cOnU6HSqWiu7ubxcVFOjo6WFlZYWdnh08//RSAp0+fMTe/QFFRKdev3+ZHP/ox3/jG1/jRD7/Otcs/JVd3i6nRDJzWKuzmCuzmCrZs1Wxv1ODaqGHLVsWmpVL8b2U4zKU4zcVsmgpZX8ljZiKHlo5ssqtyiSotJ7SmlfC+cRKXTWRtuSjc36Vgf5ccjwed00GOzUC5ZYh2Uw2TJi2r5gjWTcFYTA8xGO4zO32Pke57dFc8pFWnoSUtma6cIoZqm5kZGMWwuIzZYsG8vs6q0cjS8hKzs7NMTk4xPj7B8PAoff0DtLe3i4DrSNeGExtzmzD1BTSqc8REXiA99SZlxaG0NMQw0JPMxEg606MZTIykMzaUxthgGoO9yeirI/7zW4EfHv7+P46PubaZlnKXxZk8FmfzuH79GlqtjqmpGY6PH58I1iYmJuju7qahoYG0tDSioqKIiopCp9Oh0WiIjY2lpKSEgYEB1td9A77d3T2Gh0dJSdHy0Udn+e53v8tvf/Mr/MlPv0NI4AfUVoSyOJ2D21HDobuBfVc92/ZqHJaKE8dpKWdrvRTXejEOYyGGhQL6hwoo0heiyi4lIKWWM5mdXKyZIGTMSJpti6KDPUqP9yk82CXXvU2OY51i2wxNllZGzPmsWOJYt6iwrQdhMj5kYf4+Y4P36Kt7QHu+mjZdIt15hYzUtTI/PMHasgHL+joWm1UEfJm5uTmmp6dlK+8fGKSjox29vpKiwgy0aWHERN1EowpAozpHbPQldOm3qSxT0dEaz+iAlpnxTOYms5gZz2RyNIPx4XTGhrSMDqQx0p/KcH8qI/2p9HUlFr8VAdTqc78cGX55JzcrELOhGKupWgbr+fPn7O7u0tfXx9LSEjqdjubmZkJCQrh27Rq1tbXExcVRVlZGa2sro6OjuN1unjx5Irtzm22DhoZmVKpw/vRP/5zf/u1v8N3vfJUzH/yQhNgLdLXGYjEUs+eq58jTyJ6rjm17DU5rFZvrlWyuV+Jcr2TLWsG2rQy3rYQtSxFmQyETk8XUdpQRXVzJ2cRafj+sie9H9fCnuZPc6F4jweikeH+X6qcHlB/vU7C3S+6WkyK7Ab1tgL71ShasaazbInDYQrBaAjGsPGB6/D6DrffpLg+lIz+RvuIixhvbWRyZwmQwYdvYwLqxgclsZnllhfmFBWZmZpicnGJ0dJyBgUE6OtrQ6ysoLNCSlqoiOvIGatV5wtRniY+9TI7uHvqqMPo6k5gcyWBhOpuFmVzmprKZHc9iaiyDqdEMJkfSZfDHBgUCDPenMtyXwlBfCkO9ScNvRYDAwA++FBF20VOQG8T6WgnrxioePz7k+fMXpKWlkZKSQkpKCsHBwdy5cwe9Xs/8/Dw1NTUsLCywtbXFixcvAHj06Jj5+UWKS8q4fv0WP/rR7wvu/Adf5+rln5Knu83YYBqb65Uceho59DSyuyUAvmWrxmmtwmmrwmWrxL1RgWejjG1rCba1YmZnS2jpr0Crr+W6rok/CG/ja/e7+EpQP99PmeB84wrRS3aKdnfQPz+g5vkRpY8OyPd4KNiyUmWfptPWzIwtF/NGHJt2NY6NYEzGh8zP3mOk5x69+hC6y+IZqChisqWD5bEZLKtmbBt2bHa74NZXV1lcWmJ2do6p6RnGxycZHBwSAK8tpyA/lZTkECIjrqEOPUeY+hyJcVfIz3lAY10UQ32pzE1ms7KQj2E+n+W5PLEDmMXMhI7pMR1TY5lMjWYyOZLOxEg648MC+GODaTIBBPCTGexJGnkrAqhUF/+nME3AXl72Q6xrpViNVRwe7vL48RO0Wi0ZGRmUlpaysLCAyWTi4OBA9hDb226GhkZITk6T3fk3v/EV/viPvk3ww/epKRfcucdRy9FOIwfuBnY29eLdXc2WrRrXRhVueyU79nLcthLsphIWF0rpGq4gp0nPw8IW/iKhi28E9/Grtwb41btDfCt6nA8rFlBPr5PndlP7/IC6Tx9R+fQRRQf7FLq3qHCu0GLvZdxezpo9DYcjAqcjFOt6ICtL95kcvsdgSxB9NXEM6YuY7uzEMDmHzWTF4XBi39zEYrWyurbG0tIS8/MLzMzMMTExJQLeSm1tGfl5ySQnBRERfgV16FnCNedJTrxGcUEQbc2xjA2nszyXh2m5CNNKIauLBSzP5bM4m8vCdI7c/p2d0HkJMJopW//EsFYmwOhAGiMSAXqTGepNZqA7qe6tCBCpuvj/hKnPv8jPCcRmKmXdWMnu7jY7u3uYTCaOj495/vw5jx8/xmQy09DQRGiohj/5kz/nm9/8Ot/59lf48P3vExd1no7maEzLRey56jjyNLLvqsftqBWs2w9sz0Ypm+YSVpZK6R2toLBVj6q0lTPaPn43cohffzDCv7sxwr+/Ncx7YaP8WcEsDwdMZG64qHl2QCPH6F8+puz4EYW7O5Rur9PgnGBws4HlzWzsm7G4NjU4bCGsrT5gdvIeIz1BDDXHMtpcyGxvF2szi2xY7Did22xuubCJbn3FYGBxcYm5uXkmJ6cZHh4WAK8pIS83kcSEh4RrLqMKOUtk2HnSUm5QXhxKd1sCM+NZrC0VYV0rY91YitlQLPQMFgpYmc9jeS6PpVlR9DHjR4BxHdOy9QsB38SwlvEhwfpHFPf/UG8yg73JDPYkpr4VAaIjLn2iUQVQVhzKhqkUm6maR4/22d72MDs7R0FBMdeu3+KHP/wxX3/vK/zg997j0oU/JCv9JsN9KdjNZexv1wvW7dTj2hBc+Zatku2NSjwi2E5LCWvLJQyOV1DaoSe8soWzmT38OHaE31JN8msPpvh3t8b597eG+WrIMD9Jn+Ra6wqJqw7KH+3TyGMaeULVi8eUPDqkZHeL2u1FepzdzDtLsG2l4HJGsOUIwWJ6yMLcfSaGAxntjmaiu4D54S7MC0s4rJu4XDtsudzYHQ4skltfXGRubo6ZmVmGh0fo7GilprqY3Jx4EuLvE6a+iCrkLFHhAWSk3aK6XEN/dzKLM7msrwo1CrtZqDeYV0owLReztixWFRcLMCzksyK6fJkAsgfIYnZCx/R4JtNjQtA3MZLBxLDg/sfFqF8Cf7gvhaHeFAZ7khjoSbz7xuAHBr7zS1ERl6Y0qgA6WuJwWitZXSzmwoUAvvWtb/P1r/8mf/gHv82Du39JRUkQs+M6tmzVQtlXEaw5rZW4bBW4N8rw2EpxWooxrpQwOllOVVctMdUtXMru4ScJw3wjfJJ3Q2f4tcAZfvXeJL92d4QvBw3z/YRxPqlaJHzKRoF7l/qXj2nmKXqeUv70mJKDHap2LLRvjzLp0mN26XC5YtneVLOxHohh+T4zk4FMDEUzPZTP0mQXlpVlnBtbuLd3cbl3cDidrFutGI0mDIZVlpaWmZ6ZQa/Xo9NlUVtbS25OgpiDX0Ad8gkxkRfIyrhDXXUEI/1aVhcK2DBX4LQJ37fDUoHVWMb6qlBONq8UY14uxrhcjFFqES8WsCISYGkuVyRAjkyAWYkAY5lMj2UIBBgWCSBa/6hEgD6JAMkM9CQx0JXwV29MgPjYaw+jIi4TH3uN5bl87JYKlufySIi9QKM+DMNCPtuOGvZcdXhEV75pqcC5Xo7LWorbWoLTXIRppZjxqTJqu6tJrGniam4XP00a5lsRk3xZNcuvh8zx6yEz/KfASf7T/VF+48Ew344Y5S8K5njQbyZzw03ts0e08IxGnlP16VPKjg+p2N+keWeeYXc7hu1CNl1JbDvD2LQFY1x9wMJcEDOT0cxN5mGY78RmXMa16cLjOcDt2cO55cJm28BsNrO2ZmRlxcDc3DyjoyN0drZQVZlHSMg9/vPvf5/vfOernD37EXl5aWRl3Ka5PpqJkUxMKyU4bdW4N2vZdtSwaa3CbqnAZirDZioTwF8rY31NQQC5vFzI2qIvAbweIId5iQATUgAo3v2jkvWnC3f/YBqjA6kiAVLkAHCgJ4mejoRvv4HlB/799LT7QUkJt4iKuEx7c5wguFgrxWYqx71Zi8tejWO9gk1zGU5LCS6LUFwxrxQyMVVMQ28lKfp6buZ18GdJA3w3cpyvqGb49dA5fkM1x5dVs3w5ZIp3H47x7oNh3lMN8wdpU1xpMpCwvEn54SHNPKOFF+h5TvnTx5QfeqjbXaPPM8iCuwq7Ox23K5ItezDrpocsLwUzPxfD4nw+RkMndusybtc2uzuH7Owc4Np2s2G3s76+jslkxmBYY35+gbGxETo6mqmsyCUzI4KYqJuoQs+hDj3LvTt/RUxkAI11kaQlXyU2Noq15UZ2XbV4xJ/DprWKTWuVWFauFPoJ5nIfAljWSrEYSrCI/QXTchHGxULWFgswiFfA8pwQAyzO5MgEEO7/LPn+n5SDv3TGh/wJIIGfwqBAgJddXbH/4Yvi//dyskMKdBlBpCbfo7khVvxGSrEZS3GYi3GaC3EYCzAvFzA5VURTbznpdXru5rfyl8m9fC9ylK+qpng3ZIbfCJ3lK+oZvqaZ4avqKX4zaJx374/w5aAhfjd+nDMVC2gmrOS7dqn/9DGtvKCBF1Q9f0b5o0Nq9jfo2Jli0tOExZ2LyxWLy6FiwxLImiGE5aVYDCuFWMxdbDpW8Hjc7O0dsbt7xPb2Dg7HJlabDbNlnbU1E4uLiwLg7Y1UlGeToQ0jKuI6qpCzaFRnSYq/SklhMD0dSSzN5rNprWLf3cDRbgub1kpiom9QXVWCY70Kl71acPU2iQBVfgQQys3rxlIsq6VYDGKDabkI03IRaxIBFgQPsDyXx9LcaQHg6QQQwJeify8BhOAvmf7upMOuxoR/+YXQz9Gp/iIvR01udijD/elsmMoE17VcwPRUAS19pejqq3lQ2Mz7KT38XtQwX1NN8G7IFO+GTPNl1RRfU0/xnmaK9zSTfCVkgncfjvAbD4b47fAR/jRnmjvda2gtW9Q8OaKVZzTzgpqXzyl/fEzV4TZNu8sMeXpYcZfgcCXh2lTjsAZhNqpYW03AuFaM1drD1tYqu7se9veP2dt7hNu9y+amk40NO+tWG0aTmaXFJcbGhmlvq6esTIc2VUVE+FVCgz8hTH2WlKTrVJaqGOhJZXWxCLejliNPI492m4Q6hKsO96aebYeeXVcDA90JqFWBzEzW4dqoYOsEASqwWypOJ8BqKSaDoCOQ28oLBYJMTOn+ZwXZtzcAFAgwJQWAw+knUr+R/hSG+1MY6ksWrT+Zge5EW1dX4D/6Aq7/nV/SZQSOZGWG0NWeIsqsilldyOdObjO/GzHIe+oxfiNkkneDp/lyyBRfU0/ynmaCr4vna6Hj/ObDUX7j/hC/FTLM76dMcKFuiZg5OyW7uzTxmBaeU88zKp8+pvxwF/2umW73CLPbNaxvaXFuhrNpDWbdpMJkTMRiLsVu78ftNrK3t8PBwTH7+4/wePbY2nJhtzuwWjcwmSwsLS0xNjpMW6ue0pJ0UpNDCA+7TGjwJ4RrzqFNvUltZRijA+mYDaXsbtVzvNfM4/0WHu02c+BuYM9Vz+5WHbtbdXicAgHcm3p2tvS4N2tIT7tNTk4WNnMNLrsvAYRroIINs9RwKhXu/7VSzKulgvtX6goWxAxgLp/lWWUGkM38VJZMgOlxHVNyACilflLpVyRAX7JAgB7h/u/vSpp654s0g2JjL/2T1JS77rycUAwLhaIIopDZiSz+IKaXd0OmeE89wdfF855mnK+pxvhy4Ajv3h/kKw8H+V70CB8UzxI8bCLbvo3+2REtPKGRZ1Q/e0L50QFVe3Za3DOMupoxOLOx2aNwWEOwmtSYjUlYLOU4HAN4PGYODvY4OnrCwcFjGXCHYxObzY7ZbGFxcYnR0SFaW2ooLkwlOTGQMPVFQoM/JjL8PJna2zTURjI5omPDVMGBu5GnB608PWzl8V4LR54mDtyN7G83yGfPVS+TwOOUSFDLulGP1VTL/FQmqtDbDPbr2bJV4LRVyzGALwGkGEAkgKEEs6EE43Ixa0tFrC6KBJj3J0AOC9PZzIkEmBnXCQQYzRDy/2GtWPpV5v5+BOhOor87seULuf+YmMtfSoi7uVNarMFqLMVkKGZ1MZ+RwXR+Et3NV0MneU81zleDRnj3wSDv3u/nG+oBfpoxzo3WZZINdioO9mjimCaeUPP8MeVHR1TsblG/vUzvVjezm8WYNuKwrYdiNamxmJKwrlewuTkkA354+ISDg2N2dvZxubYFwDckwBcZGRmguamKwvwkEuPvo1EFEBr8MdERAWTr7tLSEMPcZC5OazWPdpt5/qid50ftPNlv5dFuM0c7TXKp+dDTyIHbeyQS7Lrq2dmqx+OsY2erDrejio7WXLq7Gti2V1NeHERSUgLGFT1bG1VsWivZtFYqAkEFAYziNWoowbTiSwCDSIDluTyBAFL+Py26/0n/ApDk/k/J/fuSpfIv/d1J9HclZX9hAkRHXfGUFKqwmcowrRSzPJtDd3sC3wtp4/+9M8hXA/v4QfwwZytnCZ8wU+Dapv75IU0co3/xmPJHR5Tteahxm2jfGmbMXsmyLQWzWcO6Uc26MRGrpRyHYwiPx8L+/h6Hh4/Z3z8WLNy1Ld/jJpOZhYV5hgZ7aWwoJy83nvjYu6hDzxMa/DGxURfJz3lAR0s8izP5bNv1PDlo5cVxBy8edfD0sI3H+60c7wnuXTpHO03y8SfB/nYDe9sN7Loa2NmSSKBnb7ue9uYoIiM0GJaaMBvyCddcp7lJAF0igd3izQS8MYCSAEIKqCSA9/7PY3H6ZAFIuv+nfO7/03P/wd4kLwE6E1RfjACBl3tFXlQAACAASURBVL8UGX7JU5gfjHW1mNXZLKaHUqltSOSjvH7udBnQmu1UPdql6eURjS+PqXr8iJK9XSrcGzRuTTPgaGTOlonREsm6MQyrKRmbaOFut5n9/T0xaDvC7d7F6fS6dJPJzPz8HAMDXdTpi8nOiiE2+haqkHOoQj4mPuYyRflBdLcnYVgowuOs4+lhOy8fd/LiuJNnR+08ORBAl4BXns9Lgl1Xg3jq2dmqY2dLz66rjq2NSpISblJaUoDLUUdrYyQRERoW5+rYslX4XQEKAkg1ACkAPIUAS3N5LM7mCgSYymF+Mps5Mf+fGc/0DQCl4o9f7j8oEkC4/xPp70g4/4UIIHX+8rMfMG+opmuth3r7PFW7m9Q926fh0yOqnx5RdrBPmcdJ7dYSnY4uJmyFGNbjsVoisVtS2NyowrU1yu6ulYODfQ4OjuW0zOnckoO2tTUjszPT9PW2U1Odjy4zgujIG4QGn0Ud+gmJ8VcoKwqhvzsF43IJe9sNPH/UzssnXXz6WAK81edI4CvPq4hwGgn2txvZ2270I0AdHqeefXcDE8OpqFT3mRpvxGEpJT72BuVlhdjMQjDoWK9gw1J+CgGEur/XAxSyuljorQDO5rE4oySAFP1nMj2uqP+LBBgdlFK/VJ/cXyz/0t+VSG9n3BcTgwQGfvClcPUFT276LTrsk5Q/eUz58SElB/sUe1xUuow0OwYZslWwsJ6KZT2WTZuWbWctezuTPHq0yZMnT3jy5FOOjp6yu3sg3OGbTqzWDVZX15iamqC7q5nKihzStRoiI64RGvwJGtVZUhKvUVmmYqhPi2W1jAN3Iy+OO+BJF58+7uDZUdsJwF93XkcEfxIcysGgRAKBAEoSCKeW3Kx7ZGSm47DWMzKQiCr0AeNjdWxay3FYT0kDRQ9gkgkglIANiwWszBewPJ/vV//PYW5CQQDJ/YsEGJMI0K/M/VPk6H+gWyBAV1v8V96IAFmpN2g1DlB2tE+ta4W+zTYWNotYdyTjtGfi2dJzsDfFk8cuPv1U6PW/fAlPn77g8PAIj8fD1tYWGxsOlpYW6e1tpaJcR1pqKBFhlwkN/phw9Tm0KTeoqQhjbDADq7GCw51mXhx38PJJFy+O/QA/bOXpYZtwjhTn0HvehgQSAYQjTCT5E8Dj1LPnqmd5Phe16ia9PbW4NirIyrhLVlYGlrVqNn0IUHYKAYpYkwiwIBBgSbz/F8T6v1T8mR3XiQTwL/9K97+U+3uLPwPdMgGe9bTF/p9fmAARYRc8GUlXaVhoJ39njzF7FXuuMJzOcNaMkTx5opzIEYB//vw5x8fH7O0JadrGhoOZmUmqKnOIjb5FaPDHRISdIyPtFnU1EUwMZ7JhruRop5nnjzr49HEnzx918PTgJIgnAP885xQyvI4ERzvNHHokEjTIBNjzI4FUE9h11VFbEUpcXAzrxiYWprVk6RIYHa7CbikTegF+BDCLBDCuKDuA3vt/aVYZ/XurfzNy/T/dlwBS8UeM/gXrTxbA706krzNht6Ul8otNS0sxQHriFarH6shyOOk1VWBdiWG2K4Whigwe7e/7KHSfPXvGo0eP2NkR7ve1tTUa6kuIjrxGmPospUXBTI7qcFgqOdpp4vmjdl486uDZYdsJ6/ws4J89an/tOUGCw88mgT8BDj0NviQ4hQA7W3VYjSVEhF0lNzeDhdkaUlPiKczXsGk76QGkGoDJoLz/BQIsK+5/b/dPJMCYjmmF+GNccf+PDqTK1j8kV/6ShPy/K5H+znhzWVnMf/dGBEhLuEJpXxmpJguNCwUst2kZ15XTlZbDgaj6ffnyJc+fP5fB39x0Mj8/TWFBHJHhFykpDMFsKOHJQQvPjtp4vO/9gUs//M8L/mcB/5lEOIUEx3utPNpt4dFuC0c7zX7ZgJcA0lUg1QQ8Tj3uzVp2XXUM9ydz6eJf8v77f8H1q+8z1JuM01aNXewFKMvAvilgoaIB5EuAObH9O6MgwORoujf/VwSAUulXSQAx/aOvM378nS8qCVcSoLgjn4SlZcqGdcy1JDGaXUxzUip74jye5PYl8GdmJijIjyQ15Q4DPVoe7Tbz5KBFEWk3+4CvJMCrwD8N3OeP2nl+3OFzPpMIp5BASYDTi0NeEijrARIBth3CmRrVUl+rZmY8k01rtV8AWKrIAEp8A0A5//cSQOj+ScFfltj8yVR0/7Q+AeBwf4qs/JHB70qirzOB3o74L1YFVBJAm3CFopYs4mbnyOpIZbwhluGsQvSxCXicTgCePHnC/v4+W1suFhfnKCyIIjMjkOmxXJ4ctMo/UIkAUsD1puA/P+4QCjyvOaeR4TQSSATwkqD5lJqAQADJ+qV6gMepl8F32QUdgMepx2WvkZtBJ8rAYg3AuFLE2rKU/+f7FIB8iz9ZsvZPSv0mhrSM+wk/h/sUqZ9MgET6OhPoa0/IfXMCJF6juCmDmOkZkhuTGKwJZ1hXSE10HC67nZfA0dERbrcbi8VCWUkyyYm3GOzL5Ml+i/xDVObZn+X6XwX+5wHe/7yKBFJM4EuAZr9swEsAbyroTQOlzuC2o4YtezVbG9ViM6jSRw9gle9/cZLY4C0Aye5/Ps/H+udl9697BQHSxPs/Taz9+xGgK4k+kQC97QkRb0yA9KRrlDSmEjM9TVxdEj2VKoZ1hVRHxbBptfL8xQt2d4UqXldnA9GRl6goCxd/eE0nCPC5rP9zgv/p485Tz2d5A4EAbX6BYDPHeyerg4eeRvbdQi1AyATqfIJA92YtLkcNLnsNWxvVbPoQoMJ7/0vWv1qsqAAW+vb/xfx/fjpbuP8VrV9l7q+0/hGRAEN9gu5PIkBfV6JMgJ72uKtvTICM5OuU1icTOzVFtD6VzooghnUFVEdEs2Ey8+TZM9xuN0ajkfS0EKIjL7G6WMzxXgsH7sZTCfC6u1+y/teB/yrgX0cE5b/35KBNPsL/v+WVBDhwv54A25u1uOwCAZwb1WzahAEVu0WoAsoFIEkHqMj/T9b/c1mYyfVR//q2fsXoX2z+SOKPYa/uXyj9did6CdCRQHdr7J+/OQFSblBel0jc1CSRdem0Vz5kWJdPVXg066trPHr8mK0tFwMDnahDzlJaFMqjHW8h5XUE+LzW/ybgv4oET4/aeXIgkUAAX0kAiQRSOqgsBu1te1NAZQDostewZa/xagEswpTxhkkkwJpAAOX2EKn8a5DLv7m++n9/7Z8i9RsbTGNswL/8q7z/JetPpLcjgd62uO+8MQEyU25SURdH/PQEEfU6WivuM6zLpzIsCtPSMgeHh9jtDqqrcgkOPMP4UAaP919t/a8jwGdZvz+4L590nXpeRYKnRx08PWzn6eFJAvh7gZME8G0IeZy1vgSQ7v/1KhwWYTB1Q5o6XivDYlB0AEUBqFD+PSn+VLp/b+nXlwBy86ff1wP0y8WfRHo7E+ntjKerNeY/fjbiryJA2i0q9TEkTI8T3phDc+U9hnR5lGsiWJ2bY2dvD7PZQnZWFBFh57GulXO00/w3QoDnr7H+V4F/GgkE6+/gmYIATw+VqaAvAYRaQLNPNVAZBHq2BOuXCLAlEUCcUfQp/ojWbzGUyArgNUn84dP9y1Fo/4Tcf1qWfoljXwrlz2i/lwCy9KvbnwAJ9HTGP+5ojPjf3ogA4WEXPJlpt6iujSJhegxNYwGNlXcYzMyhXB3O0tQ0bo8Hg2GVtNRQEuOu4nbUyu3UL0wAP/f/Kuv/LPD9SfD8UadAgEcdPD1qP9EvUBJAsn6frqCCADsuRf6vvP+t1TglGZho/TZjmcL9K9bKiASQc39R/Su4/ywh+vdR/qQrlD9aRgdSGfURf0jNHwF8ofuXIBCgPcHd3q7+5TcjgPqCR6e9TW1tJImTI6iaSqivvM1ARjZlqjDmxydwud0sLCyQlPCA9LRb7G7Vf6H7/20JwNNu+ZxGgBfHnTw/9hLgmaJp5E8A3wDQqwtQBoCeLWUBSIz+bdKEsnj/i6tlbMZSrFLxZ6UY07JEAIX2T+n+/YQfvu5fe0L3P9KX4uv+xdavkgC9HfFrXdmB/+1bEOAOdbURJE0MEdpUQV3VLfozMikNDWNmZASny8X09BQxUTfIy37gI6b4QgQ4/HwE8AdZSQB/Erw4VhJAjCte4QF8O4KNwoCqIgXc3fbtBG5LBBCHV5VKYCH4K8O6Viq7f9NysSz/XpWlX6fV/sXgT6n89XP/PuD3pcjRv1T77+uSwE+gpz1h4p032QwiEyD9DvW14SSP9RPSUk1N1U36MjIoDQljamCQza0tRkeHCA+7RFlxqKim/fkS4NPHwvESoOO1BPBtCXutf19OARVNoK06P+uv9rN+pfsvZV2cAPJavyL1m81jaSZPFn7MTflbv7f06637ewkwpJB+CaNfSfR1JfgSoCPhzfYlynqA9Ds01IaRPNpDSKueyqqb9GWkUxqiYbynF8emk/7+LtSq89RVR8j5/9/WFfA6Arx80i2D7yVAx2sJ4O0GCuArCXDgbmTP3eDXBhbdv70G10a1MAsgBn8SAWzGMm/ubyjBLBZ+jEtFCuWvUPlbmhFVP2LqN6uQffm4/yFv4UcJ/lBvEgO9vtbf1yWDT3dHQtnbESDjLo36MFJGughpb6Cs6gY96amUBqsZ7erGvumkq7OZkOBPaGuK4/F+C/vbDT+XIFAJvjL9UxLA2wtQ6gWbZQIog789n+DP2wDadtQKrl+K/K0i+JZTrF8s/BgV0m859ZvJZVFU/cwrp34k2Zef8FOWfYuyr6HeJFn4OdCdRF+3AH5fp4IA7fHJb02AZr2GlKF2gjqbKam6QXd6IiVBaobaO9hwbNLcXE1I0Mf0dSW/HQFekwa+jgC+wPuC/+K4g+fKMrBo/Y/3JQI0K9I/RfnX0yAGfw2+1u/QC1tKNqpF91+psH4h+LNKA6Ci9Zvksm+hbP3Ls3ksTuf4Wr+s+smUdf/Cype0U3R/ouq3V1H86RbA7+sUwBcIEBf0lgS4R2tdGKmDzQR3tVFYeYPO9HiKg9T0t7RgszvQ1xYTEvQR40MZHO/9zRHg83gBf+A/ffyaPsCRtwzsXwKWUr+jHQF8OfXbbpCLP+5NPdv2Wu/db6s6Ab7N6Dv9K4PvX/YVrX9hKvuk9UulX2XfX1H4kUWfsvV7078+Kf3zEuDCWxOgvT6M1L56gro7yau4SYc2huJAFb2NTazb7FSUZxEa/BHzU7kc7za/kgCfWQo+LRB8RTFICvBeHJ9u9a8D/3Wp34EI/r5bCb7Y+BGrftLKOW/hp1wmgKD79xV9rC4KBFiRRR+i6FN668dEtmD9Yzqv5m8kQ1z4oFT9CLr/QXnjRxKDPYlC+tedKFu/lwDxb9YH8CdAR0MYaT21BPV2k11xi3ZtJMUP1XTV1WNet1FYkIxGdZbVxSIe7TTJBHijQPBzNIO84HfKgd5ng6+0/pYTqd/hTiMHO40+4MuNn8063FLff0MZ+VeKZd9yuexrWS0TNH8rSs1foVfyNedN+xakV774a/5GFKmfZP0DqfLCJ0n0Kcu+/axfIEA8Pe3xdLXH/d7bESDzHp2N4aR1VhLc10tG+S3atOEUP1TRXlOL0WwhWxdFZHgA62tlHHo+mwBf1AtIDaHnUkn3UQfPxfTuNOCVd/4zv+bPqXn/rpDzH0hVP7cA/q5LbPxIqh97rbzWxmkVdP8On5Zvmc/Qx9pyEatLBbLiVxZ8iNY/J0f+WcyMiStf5H0/6fLM36lDH2Ll77MI0N4c89W3IkB25j26myLQtpcR3D9AWvkdWrVqCu+H0lpZhWHNiDY1lNjoS2yuV8mNky96DXyWIOTpUTvPjrwE+Fx6wEMJ/NZTwBfVP7tNJ8Df2xangTdPgn+a9dtM4sjX2ul6v5X5Ajntkzp+cwrFz6yY908rJV+i4nds0Hfef0ip+e9JlHX/fb7VP3ra4+lpj3/Z1frFl0KcIEBPcwTaliKCB4ZIKb9PszaYwvuhtJRXsLSyTFLCA5ITrrFtr/WZrH1jL6BICYW0rd17jgSrfi34R74dP3/wBQI0cSTO/UsE2JPl33XsiJbvlsA/NfDzl3uVinKvYq/1Kzp+i/56v8ksZseFps/0aCZTIxlMDvt1/fw0/0M9KSL4ryJAPL3t8XS3x9PVHv+4qznmV96aAH2tUaQ35RE8OExi+UMatQ8puBdMU0kp84vzxEbfJFN7mx1nnQ8B9re/GAH8SfDk0Cvc8JLAW8t/JpHh6DTgPw/4TaeAXy+AL7Z7BQIoSr7rlT4dv9PUvmtK619QDHv6yb3kqt+osunzCsl3v7/1e6P/PpkA8bL1d7fH090Wv9/cHPvP3poA/W3RpDdkETw8QlxZIA3auxTeDaahqJipmSkiwi6Tl/3AZ57+tGvg85LAlxBeMJ8qJ4JOOUqlj6/oUwK/WQb/aEcBvrvBB/wdpxDx+0b9vq5fFnuIal9v4FfsG/j5rHrJPWXXn7jsUan3k4M/hfX3CmdAUfcf6E6kTyaA4Pp7O0TwBQK4uqpj/8kbEyBMJWQB/e3RpOvTCRkZIaoshDrtbQruBlOXX8jI2BAa1QVKi0KF6tkpBPg8XkAigSTQfKVXODidBCetvsXX6veaZeAl8PflVq/S8l8HvlDvPyn1Fip+AvhFrC55xR5LCqnXglLsIa96VSx7GBIIIIM/kCoLPhXLnrwjX0oCSNavIEBXe7ylri7wH74FAQI8WRn3GOiIJaMmhZCRUcLLVNSm3yD/ThC1ufn0D3YTGnyWmsowjnaEfb5v6gUe7bbIBBAI4Xs+e97P9897rd4L/qE/+C5f8D0OPW5Hjdfty+XeKjHiF9e9mHzn/IxSzi/t+puXlL6KQc9pX+ufOkXtq+z5S3o/WfHbq5j48XH/XutXEqC7PX6hKzDw7781AYa64sisSiR0dBRNmYZq7TXybgdRnZVLV3cLwYEf0VQfw9FO06kEeFUsIJFAGBRpkY8EnLSv5zQifBbwUpSvdPnSnS/l+sLqF2+Z17MpSLy94FexpQBf2Pkngi/KvH1VvkV+Y14KnZ806Dmp81n0LICf4ev6FWVfed7PZ+BTSQCp9i+A7+MBWmPH3gh8iQDq0ACPLuMew93x6CriUI2OoiqLoEJ7mbzbgVRkZNHcUkPQwzN0tiXKHuBVXsCfBNIMniTBUurylSJNfyL4zvj7/jnvvyF19hTAy+CLg54S+JsC+F7LF7p8WwqR54ZZGPJUbvmQ3hZmXFYOeQjgL0tLHhRbPuf8ev1To5my1Fs57DEyKFj/SJ9X7uVr/RIBlJW/E9ZPV1tc31sS4LxHl3GXkZ4EssqiUY2OEFwaQ7n2Ajk3H1CWloG+roSghz9jsDeVA08jO68ggP9VIHwtEaDpxLVwGgmE81nAK7p6O4oCj/K+3xLBF61eSPdeAf66AP6GuUJ8rYxk+dK9LxV8TtP4Szq/HJ8NXz5LnofTT655lZs+ySesXwl+v2j9Pa8gQHdr7BcfCVMSQBVy3qNLv8tIbxJZpRGoRoZ4WBpPifYcOTcfUJySRkVlDoEPf8bESCYHngY8Tv0rvYC0cEG6Ej4rNnj1afI5Pts9xJKuP/DydO+WsPFLAl8Sd7we/NNWvHjBl5o9KwtiwUfS+EngKwM/udWb6ZPyyZM+ylk/n1VvySL4ST7gK63/hAdoia1+SwKc8+jS7zDal0ROsQbV8BD3y5Io0n5C9s37FCQkU1SUSkjQGeanc9l3CwSQvICSBHvirp09mQDe0evTSKAkgveKeDXwRzuNPhZ/oLD4PQX4yvteyvE/y+37p3sS+JLC16Bc76IAXzniLah8M32GPMcVgx4S+KP9AgGG+r3gD/Yk0y8TIJH+rgT6/cu+/gRoi6OzNbborQgQGnzOk6m9w9hAMjmFoaiH+7lXlkKB9iOybtwlLyae7JxYVCGfsLJQyN52gyya8JLAO1ErLVwSvEH9Z5LA94po9Dnyn5eBbxAlXA2Kkm691+U76/xc/knw5bk+SyUbYsB3GvjKyd5VyfJ9Uj5pt58Q9c8o1rvI610lAgx6Xf9ovzjnpxj1PmH9Ivgn6v4n3H8c3S2xurckwCeezPQ7jA2kklsQjHqwlztlaeSmnUF34zZZkTGkp2sIU5/DtFLC7lY97k29TAJpsaKXAN4jzdufRoLTrofTT4NP+/YE8NIgh/R5/K3eXi1E+jZpqZM40OkDvq/b993r4z/ZK+X72XLKN6Oc8BnL9AV/yLvjT7J8mQAK8AUCiE2fzs9j/QIBOltiU96KACFBn3gytXcYH0olryAI9UA3t8ozyUr7kIzrt8hQh5OcHERUeAA2U7l3Xs6hl1eqSmNUUl9d6LIJ4Oz5kUDay7fv9r0ihOMVaUqWviceJfBSF0+45/2tvuZUl+/02e7tBX9dUegxGYrFrR6ngO+T8nnBn/V/t89Iut98/+ngD/cqNn30JNMvTfx0Jr7S+mUCtMXT3SoRIC7mb4QAE0Np5OcFounr4EZ5NpnaD8i4fpOUoBDi4u4SH3MZx3oV7k09Lrs0Mq0X5+Vrfa4FgQReT7Dn8lqrJMFSEkNS5sjH/9eiZPt04Gvlqp4c6CmsXhns+Sx0NHlXur5qo9cJ8Gf8wc8W9/rpfASeyj6/POMnbvjyVv0US54l8Lu84L/S/bd5rV/0AOq3IkBw4MeejLTbTAylUZD3EHVPK9cr8tCmvU/G9Rsk3H9AZOQ1UhKv47RVs+3Q47J7N2ZI41PeK8FLAokIvtdDHXvbdT4u3EuMegHobd+rZEe5us1Z57V2GXwJeEnHd9LqvYucFC5fsczJ9873e6WLQuChBH9WMdolv9hBCf6QljF5xMsL/rBc8lUseury9vtfaf1tJwnQ1RL78K0IEBj4sSc97TYTw1oKcu+j7mrkWmUhKanvk379OjE3b6FWXyIj7bbcMpXO60ggxQbK+MB7PUgEUQJdx474+7tbfqD7AK/3dvAUXTypjy/LuF7h8n2XORe/3vKV4M8I4Hu7fMp83zvaLY93SeCLfX5pw5dPyVfe8u1t976SAO2nE6CzJfb22xHg4Uee9NRbTI5oKcq9i7q9jquVxSSkvE/6jauEX75MSPB5crLu496sZWujGpe9+pUkkOKCk/GB1zNIC5nlKVzxyP9dOvKOHkGp6wXd27/3gu9d4765Xol9XQj0fFy+0evyveCLc/yvAX/xFPClnT5Ky58Y1jImEWBA6wO+z5RPbzIDiqZPnx/4p7r/U8Dvbo2jqznmiy+GUBLg4cOPPNoUgQDFuXfQtFRzpaqUuOS/RnvjEqHnz/Hw4ccUFwThcdbitFWJJDjpCZTHS4haXyA3FbP3Tt/4Qfg9Ma7YrJVBPwH8Ro3PuwYl+dbmup/Vn+LyleDLer6lQgyL+Z/b8v3Bn5TEncP+jZ7TwVd2/GTLfwPr72qNo6MlNuDtCPDgjEebfIuJkXRKcu+gaSzjcnU5UUnvk3r9AkGfnOH+/Z9RWabC49TLBPAngcteK54aIRhz1PiMVyuzBiU55D8jHrdCoSOcGl9Ll139acBXyCVd5ds7vKtblPe9BH6BD/hLCmGHBP6c4kUOMvhyvn8S/BGxy3cC/L4U74iXmPN/pvX7gd/VEkunfGJob4o5+3YEuH/Gk6YgQGhtIZeqKwlP+oCU6+cJOnuGe/c+pK46QiaAcKSFSTVsbQhHuBqEI83VKQNGgRgnvYVEGGWXzrVRrbjXTwNdHNY4DfhTAj2l1Z8I9qQFTjL4iuaO9BIHRa4/rQBfepOnPNip0PeN9KV4R7xE8KUhDx/X/yrrbxOqfV2t3qMEXzhRZ96KAA/u/8yTmnzTS4CqHC7VVKNO+oCka58QdP4j7t39kJaGGDxOvfzGLOlIRDj9SCTw9xannA3vJM6WD/BVXtDFCR0JeMcpFi8cXxHHSas//b73f3/faeCfZvknwU89BfxkX/BPsX7fOz/uBPgdzbF0NMfQ0RxNe5Nw2hqj3387Atz7UCZAae5tQisyuVRbS3DCByRe+xlBFz7m3r0P6WqLx+2oFd+TIxGgEqet0scrSEcgQBXOjSpfUoi7dnx+z1ZzAmx/wCWZltSz3zCXe+94U5kMvtLd+9z1flYvgJ8na/mWZl4D/vhJ8CdGXgH+wEnwhW5fks9+PyX4SqGHP/idLYLVdzTH0tYYTVtjFK0NkbQ2RNJSH0FzXfhfvzkBLn/wpXt3P/CkJt1gYiSdsrzbhJakcqlOz8OED4m/9j5BFwUC9Hen4LLXYrdUyi9KkF6bIhzJI4jRuHicrzzVwsYNq1eNs7kuHaWlV/gAbz8FeMHVl8j9ey/witxeafUi+P73vRL82VeCn346+IOfDX6/wvKV8m5/8LtaY0XQY2hviqGtMZrWhiia68Jp0gunUR9Goz6Mhmr1m00FyQS484EnJfE6EyPplOffIbQwkUt1ddxPOEPstb8k6NJH3Lv3ISMDWrY2hNWojvUKOdqWyCARwiEe/6vChywngFbc6RbpVMjjWPJMnqlMYe2Cm1eCL0/pygKOQlm+5bV67wsbfV2+qOOfEoM95e5+BfjjI+knwJd3+ff5LnWQwVfIuk/X9sfR1Sa5+RjJtdNSH0VzXSRN+ggaasNoqNFQV62mrko4+koVdZWhP35jAly+/MGX7t75wJOceJ3JkXQqCu4SnBvDhbp6bsd/TMy1Pyfw8kfcv/8hEyMZOG1VbJjL5aBLqrDZ18UjWqmSFCeOxevKfcA2+x9hAbMMvNH7QqbTUjqTAvw15Yo2n0DPV759msuXevo+4I8oSryvAr/fq+3zdfn+sm5xpk9s53a1ea1dsPRIWuojaa6LoLE2nIaacOqq1NRWqqgpD6GyNIiywgcU5d2jtPAB3//+b37j7Qhw831PUuI1mQBBmeFc0NdxI+4Toq79CYGXP+Lhg58xPa5jc71SrqhJIgrpdSkSMU4/3nKs16p9QfY/NlM5NqN3HEt+Heuqdxunb2R/LjRI1AAAFY1JREFUGvAFvsD7q3imFVavCPZmxjJlOZc8wyeWeKUGj7TCVQa+N1lc5nAS/F5pm1dHPN2itXe0xNDeHENbUxRtjVEi6OEi6GHUVWnQV6qpLguhrOghRXn3yNXdIiv9OtkZN8jT3aK8OPDlr/zKP//VtyLAnZvve5ISrjExrKWi4B6B2lAu6Ou4GnueyGs/5eGVMwQFfsT8VI7PS5KFI5GhXA7KNk6cCi9ZzEqAy7AZpX9D/Fo80uz9ugy4lMop2rXSC5ll4CW1rmJEe/6LWL3vfS+vblF09uRBjsE0HzWvF3jlS5y8E7yido+O1hg6WgTQWyXQ9RE0yaALll5ZGkxpwUMKcu6SnXETnfY6Ou0NstNvkJt5kzzdbfKz7pCXeefwX/7LX/4Xb0WA2zf+2pMUf5WJ4XQqCu7zMPkhF+v0XI4JIPzaH/Lgys8IDvqYpbl8NsxC+9SbbpUJObd4TpLjJFkkdy6DLW7Zks66tHRJXrtaIr984QTwS6db/IoP8Lle4eZMtryj93Uuf8pH0KGVe/pyoNd/CviKd/f0idbeJSh26GiJpq0pmtamKJobImmqi6BRH05DdRj6Kg015aFUlARRnH+fvKzbZGXclC09O+MWOZm3yc64SWbadbTJV0hNvIw26SqhQR/OvvPOO28mCfclwBUmhrVUFt7nYdxdLur1XIi+hObaf+belQ8JDfkEw0KB3EJdXysV7mKj99c+pDCWKo5v0GZdU1j4qvKIUbz4xm3J0qURbKWLl6J6+UWMfsBLrt5frz8vTeu+1uozTgA/KgGvlHHLYo4keW6/V3bxsYKlN0fR1hRJc0MkzfUC6PU1GvRVaqpKQygtfEhBzj1yMm+RlX6T7PSb5GTeIlcnHF36DdJTrpGSeJnE2AvERp4jKuwTIjSfkJp4jT/96bfevBUsEOAnX7p5/a88iXECAaqK73Mv6gYBtTWci76C6vqPuXP5AzTqc6wtFgnrUBXWaVkt8XHV3qjc+/X6WgmWtRIZaCXIFkOpDLbZUIx5RTgC8EV+Lt4LuqTL997xeT53/Ang5RczK+r5yk1dY37ADyuEHIOpDIvgC4ObXvWOsKlLjOJbxdJsc7Tg3n1AD6O2UkVFaTDFBQ/Iz75DdsZNsjNukpNxizzdHfJ0d8jJvIVOex1t8lWS4y8RFx1AVPg5wtUfE6b6mAj1J0SFnycl8QYxERdtv/zLb+H+JQLcuPaXnoTYK4wPa6kqfsDtsKucq67h4+hrhFz/Ibcv/zUR4QEYl4vk4UizQZlzK74+5dfer0WQxb/vA7a4X8+0LIGusHIxjVtdLPC6+fl8eSrntOBO0uudDvzJ3F5q43rr+WmKhQ2KLZ1iDt8ju3gB9I5moUDT0iAGcvow6qs11FSE/n/tXWlwVNeVPnZErAkYByXG4JUxXuJgx07seBu8O7awwTZLS0gISViA6H1Rq1vdrQWEkNT7vqm19aaWwEiAEEsMBrMbb9hgtsF2KlNJ1aRGnplUTSpTE883P+57r18LQmrKC4boVN1CWPjXd7+zfOe8c7E+sxrpRD3i3QzgeKcJ8S4TEt1mxLvM6O6oQyxsQNiv41iugL1dBus6KaytMtjb5XDZVPC6tAj6ahEO1KHRvPzDmTNvffArgc9fgFp9xajXrcO7h9kFMLZoIds4hJVOA9YY5sKorYTTrsanZzLCW7jZk8mRWnkms7+LY3cfPjvbJ/w7AehToj9PjUnkctw7D3oiW8Mfj+fE95NjgD/+oWhwY6yoM6aFK36b56joO32+a8dv5dwrxHXGdB707cOsTt8y2IqNA83oTzci2WtBb1cdervqEO82IdljQbLHgninCV1RAzqCegS9WnidKjhtCtjapLC2SmFrk8FhVcLt0CLgrUXIb4DHWYOm+uW/q1w6b9Ojv7xvBRHxa2H//8shx14AfU35qMelxbuHIxjMNELXpEb1ho1Y7jShsfYl1Goq4HFq8Rt+EeJpLgkTCS6fnenLEWCE2M0DLfwujU9PpTnAGcvPnWTnn0+mhOXKWdBTOQndhYAXFDwhs8+d2Mn9SkcMfIeopMt+o3dof25cf3tXNpnjy7adIzbsGLZiZBNj+Yb+NehLNiDRY0a8y8QBbkayl4HeGzOhM2JAJKCD36OG26GEvV0OW6sMtjY5HFYF3HY1/J4ahPxGBLwGtK9T/kmpKD42Z87sjjvvvGXZhAkTHiCiHxLR1UT0Pe7Pr2ZaraRArysf9Ti1OHoogqH+JijNSqzs34AqpwUWwxzo1eXweXT4zdn+LGgcW89xahuvs4vd97lTae732fjNwE7hHAe2+PCvamfde3bJMtu6wZdx2a9ws8D3ZoEXfZxx4ayen9QVuXhhDTu3fGE3p8XzAs12J8d0K4aHsrV5Km5BoseERLcJiR4zUvF6JHvrEecy+Y5wLUI+HXwuNZw2BextMtjaZLC3K+C0qeF16Ti3boTHWQOzsepfShYXbn3wwVkNU6ZMfpmI7iGiGzjgJxFRPrGs/6sxX3wBanRLR91ODY4eimDTQBNW1SqwPL0eyxz1MBkKUaMuQ9Cnx+dnM1wCJjqcu2aAp4RYPTZ2Z/+fLMPPnkjmAH7meILt1uObM9yqlZNcQicGPhf03M3bxy4k3x4RCTii59cOCe7di7d3e7B3l5uVbTt4KdaObVus2DK4DhsHWJmW6rEg0W3mALcw0Hss6O0yoTNqQCRYg4BXA49DCUe7HLY2OeztcjhtKnidzK2H/XUIeI1obZH/USaVHH3+uUeCM269qWLChAkPE9GtRHQ9EU0hoslE9AMi+j4x1n89wIsvgE67ZNTlUOPowTA2DTRhuUaOykQGFc4m1BkKoVWVIhI04PMzmVy2XugIiVqSO/zvREALgDOGn/44IZxTH8e5rhwHNufez3fxYzJ5AfTs+rX3xaAf4uL6viAO7hO7dw/2vunGW78WJXLDNmzd1I6hDS1Y37cafYl6JHvNSPaYke6tR1+8QQC9p7MOsUgtwgEdfG41XHYF7FYGuMOqhNuugd9dg3DAiEjABJdD+79Gw7LPiyQvDD7wwN2G666b+AIR3U1E04jF9bFMv/prB/1vXYBKpRxLu1Mod62BwVAIraoEsUgdPj/Tdz5rc07qvP/GZ+mnTySyPx/PduFOcYuUedBPHutlixX55YpiwEXrVvgXts/v0uW+tsG7d/a6Nl+y8fP0fMnGuXY+gUs1IhWvR6rXgnTcgr5EPfoSDUj11iPexRK4aFDPWM4lcPZ2ORw2BVwO3q0bEAmaEfAasa5Z+kX18gUHnnnqIdfNN95QSkQPEtEtRPRj+jZY/rcugFZTOuq0qfDOAXYBymQylEYTWOpaC71hDtTKxejqMOOz0xlh933uEens3N+zPydwmkvahMRNVKefPBYXAZ5dqSp+T+/j97sEpo/tzokFG2HXjvCyhhh0UZ3OSbAjm7kELrOaufZeC1JxC9KJBmSSjehLNDDX3mlCLFKLkJ9nOavNHVY5XHYlPC4NAl49IsE6hAMmOG3av9TqK88uWPBc/6xZt2smTZr0LBHdSSyWi1l+DWVZfmlMq5UUaNX8BQhh00ATildKURToQZl7HXSGl6BWLEZPpwWfnk6f764FQMWSK3fEP380tlRj5donx3rYEmVulSq/T094SPk90Rc34uWKR8Zm70Ec5qRYfpMG31ffvZO59h3DNgwPtWHj+mYMcN20dJy59EyyEZlkI9IJlsl3x4zoCOkR9GkZy+0KOKwKOG1KuB0sWw8HjIiGTAh4jWheLf1DVeVre2Y//vP2adOuLyKi+4noZspl+T8Q0QT6tll+MdNqJQUadcmow6rEkQMhDA00YlGVFAs8XShzt0JTOxdqRTESPQ04dzotxOhTY4AVQOVBPnb+OSGK47ks78LH73VxS5RZJ+4jTpbN2aolSuLeOZBdpsQ+oc4OU7y104Xd21l9PrKlHZvfWIcNGZbApRP16EvUI5NsRD8HeipeL0rgWJnmcSjhtMnhtCngcqgEtx4NmREJmWG3av+7Rlv2yatzn0rcc9dtsvz8/CeJaCblsnwifRdYfjHTaiUFGlXJqM2qxOH9QQwNNGJ+pRSvOjqwxNMOVe08qBTFSPU24typtEhl68113RyjxeCeyInh/BG59Pc78dF73OEWKAosH/tu7sHs+tSDwkQNP0jBXHuW5a0YXN+MgXQTF7/rkUk2oD/ViP4U79rN6I7VoSPMdHavSwWXXcEAtyvhcWrg59x6NGyB32NAY/3K35eXz935yCP3rZ069Ufzieg+IrqJLszybzZ5+7pMWyUpUCsXj9raFewC9DfglXIpXm6LoNRrhUL/KtTyYqQTTTj7SVLktpnLzjI5F2QhaRuTrYszdvFbeR8c6cD7h7MJHHPr4SzL92Y7bHu5eL57Bxue2La5HZv5WJ5qQF+iIQt4ugmZVANScYuQwEUCNfB7NHA7lHDaFXDZFfA41fB7dAj5DYiGzYgETbC1a/6kVpR+WFj4RGzmzJtX5OXl/RMR/SP9dZZ/9wEfa9oqSYFKWTxqbZPj8L4Ahvob8PJSGV5YE0Cpzw5pzXyo5EXIpFbj7ImE0EI9/kE3jr/fnROzBZ19TMImiDE5SpyI5YeiIvmVW5QgjuV8L51L4ASWD4xleSP6U03oTzWhTxzLw3qEfFr4XCq47Eq47CyO+9xaBP21iIZM6Ahb4PPUot6y/LdLSl7ihJhr5xLRLCK6kbJ1+bXESrTLh+UXM22VpEClYBfg0L4ABjP1KFwix7MWD0p8dqzULYRKXoSB9BqcPp7gmN3F4rY4dr+bBZtntvirmfOlV9FzqNzHkfwbOEx6dXPSK1PgRja352TsfYl69IlZnmxEmivTeDHG71HD41TCZVPAbVfB69Ig4K1BJGhELMpYbm1V/lEuLTr6/POPBGfMuKlywgR6hIhmENFUYiy/jhjLv/0S7duwqipJgVJeNNreKsPBvewC/KpEjidqnSgNOFGlWQSVTIL1fc049XF8jBuP4UPu5MbvWM4EjXgpUo4CJ9La94oHJ7Y5sH3Yii1DrC5nGXtDDuD9qabcjJ1juZdjuduuhMehhs+tQ8hfi46IGbGIBR6X/kuTcdnniyUvDN5//93GyZMnFhLRT+hKZvnFTLgALTIc2OPHxr56PLtYgce0NpQEnKhUF0Mlk2BDphmfHOsVmC0+H7wjit9jnj0b+9wp79azyZsbb253YseIHSOb2jC0YS1T35IN6IvzyVsTBlKM5cneevR2mtAZrWWNFTdrrLjsCrgdjOVBrx7RUB1iUQvCARNaW+RfVK9YeOCZpx5yTZ8+dQkRPUREt1Euyy+NEHOprapKUiCXSkZbW6TYv8eHN/oseGKRCg/K2lESdGKpcjGUMgkG17fg+Add+OCdMVn6oQsDLn7deh970oRz65z6NuLAti1WNiTRv4bLzuu5BK4RA2lRLO82o7vDiChXl3tdKri5WO5xquHzaBEOGBjLwxa4Hbq/GPUVZzghRjtxYv5zxOTW6ZTN2Hm59cpn+cWsqkpSIF/FLsCBPT5szDRg4TIpnlNZUOx3oUS+BCqpBFsG23Dsvc7soiPhTftwrkvfkzsWxcadnWwsaqsVw0NtGFy/9sIlWroRmSSvvtUhFq5FmFPfGMuVAstZLK9DLGJGyG/E2jXSP1RVvrpn9uMPWKdNKygiop8Ta6qMs/xiVlUlKZCukoy2tqzCgb1+DA40w9HyOqqblFjodaNIXg61TILhoXa8dySa+4YtJ7Xu3+3F27vcgtS6W+iZn5+8pXmWp1jGnkk2Ih3nNPYOI6KhGgQ8rJPmsisElvs9OoT9BsTCZkRDZjhtmj/XaMs+eWXuk/G77rpNnp+f/zQxufVCLP/mmyqXq2mrJAXSasnourWrcOjtALYMtiLolkO5VosFHicWy8uhURRh66Z2HNkfzO6r3SWWWrP9cnHrlHfr6bglR4hJi9x6LKwXNHa3ncvYHUoWy316dITqEAtbEPAasLp+5e/Ly3gh5ocLiMmtt1CW5ZeuqXK52osvPlawcsVCdgH2BbFtixXdYR1qWnVY4HaiVF4OrbIYw0Nt2PeWl2ub8nPtbOhx66Y2NiDBuXW+g8aD3pdknbTeLvFUjAZurkTLxnIdwgEDYmETokETbG2q/1IrSj4sfPHx2MyZN6/My8ubTUxunU7ZjP270VS5jK1gWcW80bYWKQ7tC2LHiA3JLiNMVh3mu51YKi+HTrUYWwbbsGuHEzu2stm3zRtbsKGfc+tCF42JMX1J1i9PdJvQ3cE1VbjZN5dNycmtKoHl0VAdOiJm+Dx6WMyv/5ZNxNzTMGXKtfOI6F5iTRUxy797TZXL2H5cWTFvtLVFisP7g/j1iAOZuBmNjhq81r4OFdIS1GhKsHGgGUMb1jIXHrcg1WsWXDsfxxM9FvTExAMSKrgdCjhtcrhsSrid2S5aR9iMkL8OrS2K/5RWS9557plfBmbcMm1ZHtFjRHQ7sQEJcSwfZ/k3ZFMryud+sa65Gof3BfHmNgfWp5tgsytQsWIBXq+cB71uCeJdJqTj3IBEsoEbkBgzBsUlb04ba5267MoclkdDJrgdui9NtRWfSRY9v/G+++4wTp78gzlE9FMaZ/klsxsrKub9e0tzNQ6+HcCb2x14o38Ngl4V9BoJVq6YD4N+KdJx1juPd2eVt6BPA69LCZedDUfwvXKfm2Xs0ZAJQZ8Ba1evGl1RNf/Ak0/8wj19+o/KiOhhYk0VnuWXR+v0CrVbKyvm/cfqxuU4sMePXTuc2PRGC7o6DFjTtAzS6oUw1i5FZ9SQM/fmtMnhtMrhEjL2GkSDRkSCdXBYNf+j1y09M/+VpzOz7rldO3HiNb8iNt16E12Y5eMl2iW0W5ZVvPJvtboy7N7JlLrhoVak4hY4rFLIVi2CoaYMboeCsdzKJFdeY4+G6uD36LG6sfpfl5XPe+vxR++33nBDQTGxubcZdD7Lx0u075hNKiuZ85FslQSxiBH79/iwc8SOoQ1r0b5uFVZULYDFVAm/h7E8EjIi5DfC1qb8s0ZZcuKlObPjd828TZGfn/8MMbmVZ3kB/T01VS5Tu4qI6NGH712t1SyBVLoI1lYZIkE9HDYFlIpiKORFcNk18Hv0aDC//rslpYU7H3poVktBwXULiegBYk0VMcvHhZjLzPKIaOprrz79pkZdCpm0CHJZERTyYqyqXvhl2ZLCYy+++Ghsxozp1Xl5eU8Sk1vHWX4F2feIgXfD3Xfc9vrjj95vfXL2L6I/u/eOddcXXFdMRD8j1lThWT7eVLnC7CpiXuAaYqBOIia+TCHGcPGAxHhT5Qq2q4kBPIHYRfg+jQsxf3d21QXOuI3buI3buI3buF3e9n9U4fMxKVK+hAAAAABJRU5ErkJggg=="

    @section = "Home"

    @targeturl = "/logout"

    @targettext = "Logout"

    @user = User.find_by_username(session[:current_user_id])

    render :layout => "facility"

  end

  def search_by_case

    results = []

    children = Child.by_district_id_number.key(params[:id]).limit(1).each

    children.each do |child|

      next if child.record_status.to_s.downcase == "voided" or child.voided == true

      record = {
          "id" => "#{child.person_id rescue nil}",
          "status" => "#{child.record_status rescue nil}",
          "remote_status" => "#{child.request_status rescue nil}",
          "Child" => {
              "First Name" => "#{child.first_name rescue nil}",
              "Other Name" => "#{child.middle_name rescue nil}",
              "Family Name" => "#{child.last_name rescue nil}",
              "Date of birth" => "#{child.birthdate rescue nil}",
              "Sex" => "#{child.gender rescue nil}",
              "Place of birth" => "#{child.place_of_birth rescue nil}",
              "Name of Hospital" => "#{child.hospital_of_birth rescue nil}",
              "Other Details" => "#{child.other_birth_place_details rescue nil}",
              "Address" => "#{child.birth_address rescue nil}",
              "District" => "#{child.birth_district rescue nil}",
              "T/A" => "#{child.birth_ta rescue nil}",
              "Village" => "#{child.birth_village rescue nil}",
              "Birth weight (kg)" => "#{child.birth_weight rescue nil}",
              "Type of birth" => "#{child.type_of_birth rescue nil}",
              "Other birth specified" => "#{child.other_type_of_birth rescue nil}",
              "Are the parents married to each other?" => "#{child.parents_married_to_each_other rescue nil}",
              "If yes, date of marriage" => "#{child.date_of_marriage rescue nil}",
              "Age" => ((Date.today - child.birthdate.to_date).to_i / 365 rescue "Unknown")
          },
          "Mother" => {
              "First Name" => "#{child.mother.first_name rescue nil}",
              "Other Name" => "#{child.mother.middle_name rescue nil}",
              "Family Name" => "#{child.mother.last_name rescue nil}",
              "Date of birth" => "#{child.mother.birthdate rescue nil}",
              "Nationality" => "#{child.mother.citizenship rescue nil}",
              "ID Number" => "#{child.mother.id_number rescue nil}",
              "Current District" => "#{child.mother.current_district rescue nil}",
              "Current T/A" => "#{child.mother.current_ta rescue nil}",
              "Current Village" => "#{child.mother.current_village rescue nil}",
              "Home District" => "#{child.mother.home_district rescue nil}",
              "Home T/A" => "#{child.mother.home_ta rescue nil}",
              "Home Village" => "#{child.mother.home_village rescue nil}",
              "Gestation age at birth in weeks" => "#{child.gestation_at_birth rescue nil}",
              "Number of prenatal visits" => "#{child.number_of_prenatal_visits rescue nil}",
              "Month of pregnancy prenatal care started" => "#{child.month_prenatal_care_started rescue nil}",
              "Mode of delivery" => "#{child.mode_of_delivery rescue nil}",
              "Number of children born to the mother, including this child" => "#{child.number_of_children_born_alive_inclusive rescue nil}",
              "Number of children born to the mother, and still living" => "#{child.number_of_children_born_still_alive rescue nil}",
              "Level of education" => "#{child.level_of_education rescue nil}",
              "Occupation" => "#{child.mother.occupation rescue nil}"
          },
          "Father" => {
              "First Name" => "#{child.father.first_name rescue nil}",
              "Other Name" => "#{child.father.middle_name rescue nil}",
              "Family Name" => "#{child.father.last_name rescue nil}",
              "Date of birth" => "#{child.father.birthdate rescue nil}",
              "Nationality" => "#{child.father.citizenship rescue nil}",
              "ID Number" => "#{child.father.id_number rescue nil}",
              "Current District" => "#{child.father.current_district rescue nil}",
              "Current T/A" => "#{child.father.current_ta rescue nil}",
              "Current Village" => "#{child.father.current_village rescue nil}",
              "Home District" => "#{child.father.home_district rescue nil}",
              "Home T/A" => "#{child.father.home_ta rescue nil}",
              "Home Village" => "#{child.father.home_village rescue nil}",
              "Occupation" => "#{child.father.occupation rescue nil}"
          },
          "Informant" => {
              "First Name" => "#{child.informant.first_name rescue nil}",
              "Other Name" => "#{child.informant.middle_name rescue nil}",
              "Family Name" => "#{child.informant.last_name rescue nil}",
              "Relationship to child" => "#{child.informant.relationship_to_child rescue ""}",
              "ID Number" => "#{child.informant.id_number rescue ""}",
              "District" => "#{child.informant.current_district rescue nil}",
              "T/A" => "#{child.informant.current_ta rescue nil}",
              "Village" => "#{child.informant.current_village rescue nil}",
              "Address Line 1" => "#{child.informant.addressline1 rescue nil}",
              "Address Line 2" => "#{child.informant.addressline2 rescue nil}",
              "City" => "#{child.informant.city rescue nil}",
              "Phone Number" => "#{child.informant.phone_number rescue ""}"
          }
      }

      results << record

    end

    render :text => results.to_json

  end

  def do_reopen_case

    child = Child.find(params[:id])

    child.update_attributes(:record_status => "DC OPEN", :request_status => "ACTIVE")

    redirect_to "/" and return

  end

  def do_close_case

    child = Child.find(params[:id])

    child.update_attributes(:request_status => "CLOSED")

    redirect_to "/" and return

  end

  def do_void_case

    child = Child.find(params[:id])

    child.update_attributes(:record_status => "VOIDED", :request_status => "CLOSED")

    redirect_to "/" and return

  end

  def do_print_these

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    selected = params[:selected].split("|")

    selected.each do |key|

      child = Child.find(key.strip)

      next if child.blank?

      NationalIdNumberCounter.assign_serial_number(child, child.gender, child.mother.citizenship, child.father.citizenship)

      id = child.id

      t1 = Thread.new {
        Kernel.system "wkhtmltopdf -s A4 --username #{CONFIG["print_user"]} --password #{CONFIG["print_password"]} " +
                          "http://#{request.env["SERVER_NAME"]}:#{request.env["SERVER_PORT"]}/birth_certificate/#{id} " +
                          "#{Rails.root}/tmp/#{id}.pdf\n"
        sleep(2)

        Kernel.system "lp #{CONFIG[:printer_name]} #{Rails.root}/tmp/#{id}.pdf\n"

        sleep(5)

        Kernel.system "rm #{Rails.root}/tmp/#{id}.pdf\n"
      }

      sleep(1)

    end

    redirect_to "/hq/print_certificates" and return

  end

  def birth_certificate

    # raise request.env.inspect

    # raise "#{request.env["SERVER_NAME"]}:#{request.env["SERVER_PORT"]}".inspect

    @child = Child.find(params[:id])

    render :layout => false

  end

  def query_to_print

    results = []

    children = Child.all.page((params[:page].to_i rescue 1)).per((params[:size].to_i rescue 20)).each

    children.each do |child|

      next if child.record_status.to_s.downcase != "hq open" or child.voided == true

      record = {
          "id" => "#{child.person_id rescue nil}",
          "status" => "#{child.record_status rescue nil}",
          "remote_status" => "#{child.request_status rescue nil}",
          "district_id_number" => "#{child.district_id_number rescue nil}",
          "Serial Number" => "#{child.national_serial_number rescue nil}",
          "Child" => {
              "First Name" => "#{child.first_name rescue nil}",
              "Other Name" => "#{child.middle_name rescue nil}",
              "Family Name" => "#{child.last_name rescue nil}",
              "Date of birth" => "#{child.birthdate rescue nil}",
              "Sex" => "#{child.gender rescue nil}",
              "Place of birth" => "#{child.place_of_birth rescue nil}",
              "Name of Hospital" => "#{child.hospital_of_birth rescue nil}",
              "Other Details" => "#{child.other_birth_place_details rescue nil}",
              "Address" => "#{child.birth_address rescue nil}",
              "District" => "#{child.birth_district rescue nil}",
              "T/A" => "#{child.birth_ta rescue nil}",
              "Village" => "#{child.birth_village rescue nil}",
              "Birth weight (kg)" => "#{child.birth_weight rescue nil}",
              "Type of birth" => "#{child.type_of_birth rescue nil}",
              "Other birth specified" => "#{child.other_type_of_birth rescue nil}",
              "Are the parents married to each other?" => "#{child.parents_married_to_each_other rescue nil}",
              "If yes, date of marriage" => "#{child.date_of_marriage rescue nil}"
          },
          "Mother" => {
              "First Name" => "#{child.mother.first_name rescue nil}",
              "Other Name" => "#{child.mother.middle_name rescue nil}",
              "Family Name" => "#{child.mother.last_name rescue nil}",
              "Date of birth" => "#{child.mother.birthdate rescue nil}",
              "Nationality" => "#{child.mother.citizenship rescue nil}",
              "ID Number" => "#{child.mother.id_number rescue nil}",
              "Current District" => "#{child.mother.current_district rescue nil}",
              "Current T/A" => "#{child.mother.current_ta rescue nil}",
              "Current Village" => "#{child.mother.current_village rescue nil}",
              "Home District" => "#{child.mother.home_district rescue nil}",
              "Home T/A" => "#{child.mother.home_ta rescue nil}",
              "Home Village" => "#{child.mother.home_village rescue nil}",
              "Gestation age at birth in weeks" => "#{child.gestation_at_birth rescue nil}",
              "Number of prenatal visits" => "#{child.number_of_prenatal_visits rescue nil}",
              "Month of pregnancy prenatal care started" => "#{child.month_prenatal_care_started rescue nil}",
              "Mode of delivery" => "#{child.mode_of_delivery rescue nil}",
              "Number of children born to the mother, including this child" => "#{child.number_of_children_born_alive_inclusive rescue nil}",
              "Number of children born to the mother, and still living" => "#{child.number_of_children_born_still_alive rescue nil}",
              "Level of education" => "#{child.level_of_education rescue nil}",
              "Occupation" => "#{child.mother.occupation rescue nil}"
          },
          "Father" => {
              "First Name" => "#{child.father.first_name rescue nil}",
              "Other Name" => "#{child.father.middle_name rescue nil}",
              "Family Name" => "#{child.father.last_name rescue nil}",
              "Date of birth" => "#{child.father.birthdate rescue nil}",
              "Nationality" => "#{child.father.citizenship rescue nil}",
              "ID Number" => "#{child.father.id_number rescue nil}",
              "Current District" => "#{child.father.current_district rescue nil}",
              "Current T/A" => "#{child.father.current_ta rescue nil}",
              "Current Village" => "#{child.father.current_village rescue nil}",
              "Home District" => "#{child.father.home_district rescue nil}",
              "Home T/A" => "#{child.father.home_ta rescue nil}",
              "Home Village" => "#{child.father.home_village rescue nil}",
              "Occupation" => "#{child.father.occupation rescue nil}"
          },
          "Informant" => {
              "First Name" => "#{child.informant.first_name rescue nil}",
              "Other Name" => "#{child.informant.middle_name rescue nil}",
              "Family Name" => "#{child.informant.last_name rescue nil}",
              "Relationship to child" => "#{child.informant.relationship_to_child rescue ""}",
              "ID Number" => "#{child.informant.id_number rescue ""}",
              "District" => "#{child.informant.current_district rescue nil}",
              "T/A" => "#{child.informant.current_ta rescue nil}",
              "Village" => "#{child.informant.current_village rescue nil}",
              "Address Line 1" => "#{child.informant.addressline1 rescue nil}",
              "Address Line 2" => "#{child.informant.addressline2 rescue nil}",
              "City" => "#{child.informant.city rescue nil}",
              "Phone Number" => "#{child.informant.phone_number rescue ""}"
          }
      }

      results << record

    end

    render :text => results.to_json

  end

  def push_merge

    result = JSON.parse(params[:selectedField])

    leaf = Child.find(result["leaf"])

    root = Child.find(result["root"])

    leaf.update_attributes(:merged => result["root"])

    mapping = {
        "District ID Number" => :district_id_number,
        "Serial Number" => :national_serial_number,
        "Child" => {
            "First Name" => :first_name,
            "Other Name" => :middle_name,
            "Family Name" => :last_name,
            "Date of birth" => :birthdate,
            "Sex" => :gender,
            "Place of birth" => :place_of_birth,
            "Name of Hospital" => :hospital_of_birth,
            "Other Details" => :other_birth_place_details,
            "Address" => :birth_address,
            "District" => :birth_district,
            "T/A" => :birth_ta,
            "Village" => :birth_village,
            "Birth weight (kg)" => :birth_weight,
            "Type of birth" => :type_of_birth,
            "Other birth specified" => :other_type_of_birth,
            "Are the parents married to each other?" => :parents_married_to_each_other,
            "If yes, date of marriage" => :date_of_marriage
        },
        "Mother" => {
            "First Name" => [:mother, :first_name],
            "Other Name" => [:mother, :middle_name],
            "Family Name" => [:mother, :last_name],
            "Date of birth" => [:mother, :birthdate],
            "Nationality" => [:mother, :citizenship],
            "ID Number" => [:mother, :id_number],
            "Current District" => [:mother, :current_district],
            "Current T/A" => [:mother, :current_ta],
            "Current Village" => [:mother, :current_village],
            "Home District" => [:mother, :home_district],
            "Home T/A" => [:mother, :home_ta],
            "Home Village" => [:mother, :home_village],
            "Gestation age at birth in weeks" => :gestation_at_birth,
            "Number of prenatal visits" => :number_of_prenatal_visits,
            "Month of pregnancy prenatal care started" => :month_prenatal_care_started,
            "Mode of delivery" => :mode_of_delivery,
            "Number of children born to the mother, including this child" => :number_of_children_born_alive_inclusive,
            "Number of children born to the mother, and still living" => :number_of_children_born_still_alive,
            "Level of education" => :level_of_education
        },
        "Father" => {
            "First Name" => [:father, :first_name],
            "Other Name" => [:father, :middle_name],
            "Family Name" => [:father, :last_name],
            "Date of birth" => [:father, :birthdate],
            "Nationality" => [:father, :citizenship],
            "ID Number" => [:father, :id_number],
            "Current District" => [:father, :current_district],
            "Current T/A" => [:father, :current_ta],
            "Current Village" => [:father, :current_village],
            "Home District" => [:father, :home_district],
            "Home T/A" => [:father, :home_ta],
            "Home Village" => [:father, :home_village]
        },
        "Informant" => {
            "First Name" => [:informant, :first_name],
            "Other Name" => [:informant, :middle_name],
            "Family Name" => [:informant, :last_name],
            "Relationship to child" => [:informant, :relationship_to_child],
            "ID Number" => [:informant, :id_number],
            "District" => [:informant, :current_district],
            "T/A" => [:informant, :current_ta],
            "Village" => [:informant, :current_village],
            "Address Line 1" => [:informant, :addressline1],
            "Address Line 2" => [:informant, :addressline2],
            "City" => [:informant, :city],
            "Phone Number" => [:informant, :phone_number]
        }
    }

    output = ""

    mapping.keys.each do |key|

      if mapping[key].class.to_s.downcase.strip == "hash"

        mapping[key].keys.each do |subkey|

          if mapping[key][subkey].class.to_s.downcase.strip == "array"

            root[mapping[key][subkey][0]][mapping[key][subkey][1]] = result[key][subkey]

            output += "#{subkey} = #{root[mapping[key][subkey][0]][mapping[key][subkey][1]]}  | "

          else

            root[mapping[key][subkey]] = result[key][subkey]

            output += "#{subkey} = #{mapping[key][subkey]} (#{root[mapping[key][subkey]]} -> #{result[key][subkey]}) | "

          end

        end

      else

        if mapping[key].to_s.strip.downcase == "first_name"

          root[:first_name_code] = result[key].soundex

        end

        if mapping[key].to_s.strip.downcase == "last_name"

          root[:last_name_code] = result[key].soundex

        end

        root[mapping[key]] = result[key]

        output += "#{key} = #{mapping[key]} | "

      end


    end

    root.save!

    leaf.update_attributes(:merged => result["root"])

    redirect_to "/hq/manage_duplicates" and return

  end

  def search_by_barcode

    child = Child.by_district_id_number.key(params[:id]).each.first

    result = []

    if !child.blank? and child.merged.blank?

      record = {
          "id" => "#{child.person_id rescue nil}",
          "status" => "#{child.record_status rescue nil}",
          "remote_status" => "#{child.request_status rescue nil}",
          "District ID Number" => "#{child.district_id_number rescue nil}",
          "Serial Number" => "#{child.national_serial_number rescue nil}",
          "Child" => {
              "First Name" => "#{child.first_name rescue nil}",
              "Other Name" => "#{child.middle_name rescue nil}",
              "Family Name" => "#{child.last_name rescue nil}",
              "Date of birth" => "#{child.birthdate rescue nil}",
              "Sex" => "#{child.gender rescue nil}",
              "Place of birth" => "#{child.place_of_birth rescue nil}",
              "Name of Hospital" => "#{child.hospital_of_birth rescue nil}",
              "Other Details" => "#{child.other_birth_place_details rescue nil}",
              "Address" => "#{child.birth_address rescue nil}",
              "District" => "#{child.birth_district rescue nil}",
              "T/A" => "#{child.birth_ta rescue nil}",
              "Village" => "#{child.birth_village rescue nil}",
              "Birth weight (kg)" => "#{child.birth_weight rescue nil}",
              "Type of birth" => "#{child.type_of_birth rescue nil}",
              "Other birth specified" => "#{child.other_type_of_birth rescue nil}",
              "Are the parents married to each other?" => "#{child.parents_married_to_each_other rescue nil}",
              "If yes, date of marriage" => "#{child.date_of_marriage rescue nil}"
          },
          "Mother" => {
              "First Name" => "#{child.mother.first_name rescue nil}",
              "Other Name" => "#{child.mother.middle_name rescue nil}",
              "Family Name" => "#{child.mother.last_name rescue nil}",
              "Date of birth" => "#{child.mother.birthdate rescue nil}",
              "Nationality" => "#{child.mother.citizenship rescue nil}",
              "ID Number" => "#{child.mother.id_number rescue nil}",
              "Current District" => "#{child.mother.current_district rescue nil}",
              "Current T/A" => "#{child.mother.current_ta rescue nil}",
              "Current Village" => "#{child.mother.current_village rescue nil}",
              "Home District" => "#{child.mother.home_district rescue nil}",
              "Home T/A" => "#{child.mother.home_ta rescue nil}",
              "Home Village" => "#{child.mother.home_village rescue nil}",
              "Gestation age at birth in weeks" => "#{child.gestation_at_birth rescue nil}",
              "Number of prenatal visits" => "#{child.number_of_prenatal_visits rescue nil}",
              "Month of pregnancy prenatal care started" => "#{child.month_prenatal_care_started rescue nil}",
              "Mode of delivery" => "#{child.mode_of_delivery rescue nil}",
              "Number of children born to the mother, including this child" => "#{child.number_of_children_born_alive_inclusive rescue nil}",
              "Number of children born to the mother, and still living" => "#{child.number_of_children_born_still_alive rescue nil}",
              "Level of education" => "#{child.level_of_education rescue nil}"
          },
          "Father" => {
              "First Name" => "#{child.father.first_name rescue nil}",
              "Other Name" => "#{child.father.middle_name rescue nil}",
              "Family Name" => "#{child.father.last_name rescue nil}",
              "Date of birth" => "#{child.father.birthdate rescue nil}",
              "Nationality" => "#{child.father.citizenship rescue nil}",
              "ID Number" => "#{child.father.id_number rescue nil}",
              "Current District" => "#{child.father.current_district rescue nil}",
              "Current T/A" => "#{child.father.current_ta rescue nil}",
              "Current Village" => "#{child.father.current_village rescue nil}",
              "Home District" => "#{child.father.home_district rescue nil}",
              "Home T/A" => "#{child.father.home_ta rescue nil}",
              "Home Village" => "#{child.father.home_village rescue nil}"
          },
          "Informant" => {
              "First Name" => "#{child.informant.first_name rescue nil}",
              "Other Name" => "#{child.informant.middle_name rescue nil}",
              "Family Name" => "#{child.informant.last_name rescue nil}",
              "Relationship to child" => "#{child.informant.relationship_to_child rescue ""}",
              "ID Number" => "#{child.informant.id_number rescue ""}",
              "District" => "#{child.informant.current_district rescue nil}",
              "T/A" => "#{child.informant.current_ta rescue nil}",
              "Village" => "#{child.informant.current_village rescue nil}",
              "Address Line 1" => "#{child.informant.addressline1 rescue nil}",
              "Address Line 2" => "#{child.informant.addressline2 rescue nil}",
              "City" => "#{child.informant.city rescue nil}",
              "Phone Number" => "#{child.informant.phone_number rescue ""}"
          }
      }

      result << record

    end

    render :text => result.to_json

  end
  
  def compare_demographics
    results = []
    children = Child.by_district_id_number.each
    children.each do |child|
     next if child.record_status.to_s.downcase == "voided" or child.voided == true    
     child = Child.by_child_parents.keys([child.first_name_code, child.last_name_code,child.gender,child.birthdate,child.district_code,child.mother.first_name_code,child.mother.last_name_code,child.father.first_name_code,child.father.last_name_code]).each
        
        if child.count > 1
         child.each do |cd|
          record = {
          "id" => "#{cd.person_id rescue nil}",
          "status" => "#{cd.record_status rescue nil}",
          "remote_status" => "#{cd.request_status rescue nil}",
          "district_id_number" => "#{cd.district_id_number rescue nil}",
          "Serial Number" => "#{cd.national_serial_number rescue nil}",
          "Child" => {
              "First Name" => "#{cd.first_name rescue nil}",
              "Other Name" => "#{cd.middle_name rescue nil}",
              "Family Name" => "#{cd.last_name rescue nil}",
              "Date of birth" => "#{cd.birthdate rescue nil}",
              "Sex" => "#{cd.gender rescue nil}",
              "Place of birth" => "#{cd.place_of_birth rescue nil}",
              "Name of Hospital" => "#{cd.hospital_of_birth rescue nil}",
              "Other Details" => "#{cd.other_birth_place_details rescue nil}",
              "Address" => "#{cd.birth_address rescue nil}",
              "District" => "#{cd.birth_district rescue nil}",
              "T/A" => "#{cd.birth_ta rescue nil}",
              "Village" => "#{cd.birth_village rescue nil}",
              "Birth weight (kg)" => "#{cd.birth_weight rescue nil}",
              "Type of birth" => "#{cd.type_of_birth rescue nil}",
              "Other birth specified" => "#{cd.other_type_of_birth rescue nil}",
              "Are the parents married to each other?" => "#{cd.parents_married_to_each_other rescue nil}",
              "If yes, date of marriage" => "#{cd.date_of_marriage rescue nil}",
              "Age" => ((Date.today - child.birthdate.to_date).to_i / 365 rescue "Unknown")
          },
          "Mother" => {
              "First Name" => "#{cd.mother.first_name rescue nil}",
              "Other Name" => "#{cd.mother.middle_name rescue nil}",
              "Family Name" => "#{cd.mother.last_name rescue nil}",
              "Date of birth" => "#{cd.mother.birthdate rescue nil}",
              "Nationality" => "#{cd.mother.citizenship rescue nil}",
              "ID Number" => "#{cd.mother.id_number rescue nil}",
              "Current District" => "#{cd.mother.current_district rescue nil}",
              "Current T/A" => "#{cd.mother.current_ta rescue nil}",
              "Current Village" => "#{cd.mother.current_village rescue nil}",
              "Home District" => "#{cd.mother.home_district rescue nil}",
              "Home T/A" => "#{cd.mother.home_ta rescue nil}",
              "Home Village" => "#{cd.mother.home_village rescue nil}",
              "Gestation age at birth in weeks" => "#{cd.gestation_at_birth rescue nil}",
              "Number of prenatal visits" => "#{cd.number_of_prenatal_visits rescue nil}",
              "Month of pregnancy prenatal care started" => "#{cd.month_prenatal_care_started rescue nil}",
              "Mode of delivery" => "#{cd.mode_of_delivery rescue nil}",
              "Number of children born to the mother, including this child" => "#{cd.number_of_children_born_alive_inclusive rescue nil}",
              "Number of children born to the mother, and still living" => "#{cd.number_of_children_born_still_alive rescue nil}",
              "Level of education" => "#{cd.level_of_education rescue nil}",
              "Occupation" => "#{cd.mother.occupation rescue nil}"
          },
          "Father" => {
              "First Name" => "#{cd.father.first_name rescue nil}",
              "Other Name" => "#{cd.father.middle_name rescue nil}",
              "Family Name" => "#{cd.father.last_name rescue nil}",
              "Date of birth" => "#{cd.father.birthdate rescue nil}",
              "Nationality" => "#{cd.father.citizenship rescue nil}",
              "ID Number" => "#{cd.father.id_number rescue nil}",
              "Current District" => "#{cd.father.current_district rescue nil}",
              "Current T/A" => "#{cd.father.current_ta rescue nil}",
              "Current Village" => "#{cd.father.current_village rescue nil}",
              "Home District" => "#{cd.father.home_district rescue nil}",
              "Home T/A" => "#{cd.father.home_ta rescue nil}",
              "Home Village" => "#{cd.father.home_village rescue nil}",
              "Occupation" => "#{cd.father.occupation rescue nil}"
          },
          "Informant" => {
              "First Name" => "#{cd.informant.first_name rescue nil}",
              "Other Name" => "#{cd.informant.middle_name rescue nil}",
              "Family Name" => "#{cd.informant.last_name rescue nil}",
              "Relationship to child" => "#{cd.informant.relationship_to_child rescue ""}",
              "ID Number" => "#{cd.informant.id_number rescue ""}",
              "District" => "#{cd.informant.current_district rescue nil}",
              "T/A" => "#{cd.informant.current_ta rescue nil}",
              "Village" => "#{cd.informant.current_village rescue nil}",
              "Address Line 1" => "#{cd.informant.addressline1 rescue nil}",
              "Address Line 2" => "#{cd.informant.addressline2 rescue nil}",
              "City" => "#{cd.informant.city rescue nil}",
              "Phone Number" => "#{cd.informant.phone_number rescue ""}"
          }
        
        
        }
        
        results << record 
           
        end
     end
    end
     
     render :text => results.uniq.to_json
  end
  
  def validate_records
    @section = "Case Validation"
    @targeturl = "/"
    render :layout => "facility"
  end
  

  private

  def check_if_user_admin

    @search = "data:image/png;base64,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"

    @admin = ((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

  end

end
