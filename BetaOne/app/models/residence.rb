class Residence < ActiveRecord::Base
	self.table_name = "residence"
end

=begin
CREATE TABLE imovel(
id_imovel auto_increment primary key,
id_client int,
c_status char(1),
c_tipo char(1),
ccep varcha(10),
clogradouro varchar(10),
cendereco varchar(80),
cnumero varchar(8),
ccomplemento varchar(20),
ccidade varchar(50),
cbairro varchar(30),
cestado char(2),
czona char(1),
cvistoria char(1),
ddatcadastro datetime,
iicdastradopor int,
nmetragem numeric
);
=end