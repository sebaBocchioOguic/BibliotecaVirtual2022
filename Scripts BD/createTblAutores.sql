use BibliotecaMartesJueves

create table Autores
(
	-- campos
	ID int identity(1,1) primary key,
	Apellido varchar(50) not null,
	Nombre varchar(50) not null,
	FechaNacimiento date,
	Nacionalidad varchar(50) not null
)
