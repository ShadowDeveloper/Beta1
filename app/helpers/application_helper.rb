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

    def text_box(input, label)
    	raw(%Q{
    		<div class="row">
            	<div class="small-2 columns"><label style="white-space: nowrap; text-transform:capitalize; font-weight:bold; color:#333" class="right inline size-14">#{label}:</label></div>
           		<div class="small-10 columns"> #{input}</div>
        	</div>
    	})
    end
end