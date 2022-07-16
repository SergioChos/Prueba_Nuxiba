----------------------------------------------------------------------------
-- Depurar solo los ID diferentes de 6,7,9 y 10 de la tabla usuarios
----------------------------------------------------------------------------
select * from Usuarios where userId >= 6 and userId <= 10 

-----------------------------------------------------------------------------------------------------------------
-- Actualizar el dato Sueldo en un 10 porciento a los empleados que tienen fechas entre el año 2000 y 2001
-----------------------------------------------------------------------------------------------------------------
update Empleados set sueldo = sueldo + ((sueldo*10)/100) WHERE year(fechaIngreso) >= 2000 and year(fechaIngreso) <=	2001

---------------------------------------------------------------------------------------------------------------------------------------------------
-- Realiza una consulta para traer el nombre de usuario y fecha de ingreso de los usuarios que gananen mas de 10000 
-- y su apellido comience con T ordernado del mas reciente al mas antiguo
---------------------------------------------------------------------------------------------------------------------------------------------------
select Usuarios.nombre, Usuarios.paterno, Empleados.fechaIngreso, Empleados.sueldo
from Usuarios
join Empleados
on Usuarios.userId=Empleados.userId 
where sueldo >= 10000 and paterno like "T%"
order by Empleados.fechaIngreso DESC

---------------------------------------------------------------------------------------------------------------------------------------------------
-- Realiza una consulta donde agrupes a los empleados por sueldo, un grupo con los que ganan menos de 1200 y uno mayor o igual a 1200, 
-- cuantos hay en cada grupo
---------------------------------------------------------------------------------------------------------------------------------------------------
-- select Usuarios.userId, Usuarios.nombre, Empleados.sueldo, count(Usuarios.userId) as totalEmpleados
-- from Usuarios 
-- join Empleados
-- on Usuarios.userId=Empleados.userId 
-- where sueldo < 12000 
-- UNION all
-- select  Usuarios.userId, Usuarios.nombre, Empleados.sueldo,count(Usuarios.userId) as totalEmpleados
-- from Usuarios 
-- join Empleados
-- on Usuarios.userId=Empleados.userId
-- where sueldo >= 12000

select count(empleadoId) as sueldosMenorMayor_1200 from Empleados where sueldo < 12000 
union all
select count(empleadoId) as sueldosMenorMayor_1200 from Empleados where sueldo >= 12000
