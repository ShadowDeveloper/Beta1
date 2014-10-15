module ReportsHelper
	def report_container name, link
		raw %Q{ 
	<div class="col-lg-3 col-md-6">
   	<div class="panel panel-primary">
         <div class="panel-heading">
             <div class="row">
                 <div class="col-xs-3">
                     <i class="fa fa-bar-chart-o fa-5x"></i>
                 </div>
                 <div class="col-xs-9 text-right">
                     <div class="huge"></div>
                     <div>#{name}</div>
                 </div>
             </div>
         </div>
         <a href="#{link}">
             <div class="panel-footer">
                 <span class="pull-left">Download</span>
                 <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                 <div class="clearfix"></div>
             </div>
         </a>
     </div>
 	</div>
		}
	end
end
