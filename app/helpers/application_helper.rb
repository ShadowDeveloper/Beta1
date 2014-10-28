# encoding: UTF-8
module ApplicationHelper
    def self.nav_item
      
        arr = Array.new
        nav_itemx = arr.push({id: /home/, href: "/home", value: "Home", icon:"fi-folder"})
        nav_itemx = arr.push({id: /clients/, href: "/clients/list", value: "Cliente", icon:"fi-torso"})
        nav_itemx = arr.push({id: /users/, href: "/users/list", value: "Usuário", icon:"fi-torso-business"})
        nav_itemx = arr.push({id: /residences/, href: "/residences", value: "Imóveis", icon:"fi-home"})
        nav_itemx = arr.push({id: /reports/, href: "/reports", value: "Relatórios", icon:"fi-graph-bar"})
        nav_itemx
    end

    def text_box(label,input)
    	raw(%Q{
        <div class="form-group">
            	<label>#{label} *</label>
           		#{input}
        </div>
    	})
    end

    def select_combo(label,select)
      raw(%Q{
          <div class="form-group">
                  <label>#{label}:</label>
                   #{select}
          </div>
         })
    end

    def radio_box(label,radio,type)
      radio2 = radio.gsub "#{type[0]}", "#{type[1]}"
      radio2 = radio2.gsub "pf", "pj"
      raw(%Q{
                  <label>#{label}:</label>
                  #{radio}<label>#{type[0]}</label>
                  #{radio2}<label>#{type[1]}</label>
         })
    end    
    
    def residence_option_buttom(id)
      raw("<div id='btn_group-residence-#{id}'class='btn-group' style='float: right; display: none;'>" +
            "<button type='button' class='btn btn-default btn-xs dropdown-toggle' data-toggle='dropdown'>" +
                "Opições" +
                "<span class='caret'></span>"+
            "</button>"+
            "<ul class='dropdown-menu pull-right' role='menu'>"+
                "<li><a onclick='scrollToMap()'>Ver no Mapa</a>"+
                "</li>"+
                "<li><a href='/residences/#{id}'>Página do imóvel</a>"+
                "<li class='divider'></li>"+
                "<li><a href='#'>Editar</a>"+
                "</li>"+
            "</ul>"+
          "</div>"
      )
    end

end
