# encoding: UTF-8
module ApplicationHelper
    def self.nav_item
      
        arr = Array.new
        nav_itemx = arr.push({id: /home/, href: "/home", value: "Home", icon:"fi-folder"})
        nav_itemx = arr.push({id: /clients/, href: "/clients/list", value: "Cliente", icon:"fi-torso"})
        nav_itemx = arr.push({id: /users/, href: "/users/list", value: "Usuário", icon:"fi-torso-business"})
        nav_itemx = arr.push({id: /residences/, href: "/residences", value: "Imóveis", icon:"fi-home"})
        nav_itemx
    end

    def text_box(label,input )
    	raw(%Q{
    		<div class="row">
            	<div class="small-2 columns"><label style="white-space: nowrap; text-transform:capitalize; font-weight:bold; color:#333" class="right inline size-14">#{label}:</label></div>
           		<div class="small-10 columns"> #{input}</div>
        	</div>
    	})
    end

    def select_combo(label,select)
      raw(%Q{
            <div class="row">
                  <div class="small-2 columns"><label style="white-space: nowrap; text-transform:capitalize; font-weight:bold; color:#333" class="right inline size-14">#{label}:</label></div>
                  <div class="small-10 columns"> #{select}</div>
            </div>
         })
    end

    def radio_box(label,radio,type)
      radio2 = radio.gsub "#{type[0]}", "#{type[1]}"
      radio2 = radio2.gsub "pf", "pj"
      raw(%Q{
            <div class="row">
                  <div class="small-2 columns"><label style="white-space: nowrap; text-transform:capitalize; font-weight:bold; color:#333" class="right inline size-14">#{label}:</label></div>
                  <div class="small-5 columns"> #{radio}<label>#{type[0]}</label></div>
                  <div class="small-5 columns"> #{radio2}<label>#{type[1]}</label></div>
            </div>
         })
    end    
    

end
