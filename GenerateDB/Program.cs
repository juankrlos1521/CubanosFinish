using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.BusinessEntity;
using Cubanos.Repository;

namespace GenerateDB
{
    class Program
    {
        static void Main(string[] args)
        {
            var context = new DbCubanosContext();
            Console.WriteLine("Generando la Base de Datos");
            
            var cargo1 = new Cargo()
            {                
                Id = 1,
                Nombre = "Gerente",
                Descripcion = "Esta a cargo del negocio"
            };

            var cargo2 = new Cargo()
            {
                Id = 2,
                Nombre = "Recepcionista",
                Descripcion = "Esta en puerta"
            };

            var cargo3 = new Cargo()
            {                
                Id = 3,
                Nombre = "Instructor",
                Descripcion = "Es el instructor de un curso"
            };

            context.Cargos.Add(cargo1);            
            context.Cargos.Add(cargo2);
            context.Cargos.Add(cargo3);
            context.SaveChanges();

            var empleado1 = new Empleado()
            {
                Id = 1,
                Dni = "75757575",
                ApellidoPaterno = "Abanto",
                ApellidoMaterno = "Paredes",
                Nombres = "Juan",
                FechaNacimiento = DateTime.Parse("1955-12-06"),
                Direccion = "Av. Uagrteche #1236",
                Telefono = "RPC 978854757",
                Email = "marisol@ejemplo.com",
                Sexo = true,
                Estado = true,
                FechaIngreso = DateTime.Parse("2015-04-12"),
                Salario = Decimal.Parse("800.00"),
                Especialidad = "",
                CargoId = 1
            };

            var empleado2 = new Empleado() 
            {
                Id=2,
                Dni = "11111111",
                ApellidoPaterno = "Sieza",
                ApellidoMaterno = "Bardales",
                Nombres = "Marisol",
                FechaNacimiento = DateTime.Parse("1985-12-06"),
                Direccion = "Av. Mario Urteaga #123",
                Telefono = "976758894",
                Email = "marisol@ejemplo.com",
                Sexo = false,
                Estado = true,
                FechaIngreso = DateTime.Parse("2015-04-12"),
                Salario = Decimal.Parse("800.00"),
                Especialidad = "Aerobicos",
                CargoId = 3
            };

            var empleado3 = new Empleado()
            {
                Id = 3,
                Dni = "55555555",
                ApellidoPaterno = "Benitez",
                ApellidoMaterno = "Chávez",
                Nombres = "Claudia",
                FechaNacimiento = DateTime.Parse("1983-12-06"),
                Direccion = "Av. Hoyos Rubio #985",
                Telefono = "976251463",
                Email = "clauida@ejemplo.com",
                Sexo = true,
                Estado = false,
                FechaIngreso = DateTime.Parse("2011-08-12"),
                Salario = Decimal.Parse("800.00"),
                Especialidad = "Aerobicos",
                CargoId = 3
            };

            var empleado4 = new Empleado()
            {
                Id = 4,
                Dni = "1232123",
                ApellidoPaterno = "Soriano",
                ApellidoMaterno = "Garcia",
                Nombres = "Saul",
                FechaNacimiento = DateTime.Parse("1975-12-06"),
                Direccion = "Av. Emancipacion #385",
                Telefono = "Rpm #758694",
                Email = "saul@ejemplo.com",
                Sexo = true,
                Estado = true,
                FechaIngreso = DateTime.Parse("2011-08-12"),
                Salario = Decimal.Parse("800.00"),
                Especialidad = "Karate",
                CargoId = 3
            };

            var empleado5 = new Empleado()
            {
                Id = 5,
                Dni = "52314689",
                ApellidoPaterno = "Ramirez",
                ApellidoMaterno = "Cueva",
                Nombres = "Marcio",
                FechaNacimiento = DateTime.Parse("1974-05-05"),
                Direccion = "Av. Hoyos Rubio #326",
                Telefono = "Rpm #536363",
                Email = "marcio@ejemplo.com",
                Sexo = true,
                Estado = true,
                FechaIngreso = DateTime.Parse("2014-02-12"),
                Salario = Decimal.Parse("1000.00"),
                Especialidad = "Pesas",
                CargoId = 3
            };            

            context.Empleados.Add(empleado1);
            context.Empleados.Add(empleado2);
            context.Empleados.Add(empleado3);
            context.Empleados.Add(empleado4);
            context.Empleados.Add(empleado5);
            context.SaveChanges();            

            var curso1 = new Curso() 
            {
                Id = 1,
                Nombre = "Aerobicos",
                Sesiones = 20,
                LimiteTiempo = false,
                FechaInicio = DateTime.Parse("2015-12-11"),
                FechaFin = DateTime.Parse("2016-05-13"),
                Precio = Decimal.Parse("150.00"),
                Stock = 20,
                EmpleadoId = 2
            };

            var curso2 = new Curso() 
            {
                Id = 2,
                Nombre = "Karate",
                Sesiones = 50,
                LimiteTiempo = false,
                FechaInicio = DateTime.Parse("2015-12-25"),
                FechaFin = DateTime.Parse("2016-07-31"),
                Precio = Decimal.Parse("500.00"),
                Stock = 10,
                EmpleadoId = 4
            };

            //context.Cursos.Add(curso1);
            //context.Cursos.Add(curso2);
            //context.SaveChanges();

            var paquete1 = new Paquete() 
            {
                Id = 1,
                Nombre = "Especial",
                FechaRegistro = DateTime.Parse("2015-12-03"),
                FechaVencimiento = DateTime.Parse("2016-01-15"),
                Stock = 20
            };

            try
            {
                paquete1.Cursos.Add(curso1);
                paquete1.Cursos.Add(curso2);

                context.Paquetes.Add(paquete1);
                context.SaveChanges();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message.ToString());
            }


            var cliente1 = new Cliente() 
            {
                Id = 1,
                Dni = "87878787",
                ApellidoPaterno = "Martos",
                ApellidoMaterno = "Saucedo",
                Nombres = "Alexander Paúl",
                FechaNacimiento = DateTime.Parse("1990-05-03"),
                Direccion = "Av. Mario Urteaga #323",
                Telefono = "976858585",
                Email = "alexander@ejemplo.com",
                Sexo = true,
                Estado = true
            };

            var cliente2 = new Cliente()
            {
                Id = 2,
                Dni = "74747474",
                ApellidoPaterno = "Becerra",
                ApellidoMaterno = "Sangay",
                Nombres = "Marleny",
                FechaNacimiento = DateTime.Parse("1992-02-13"),
                Direccion = "Jr. Junin #125",
                Telefono = "Rpm #326541",
                Email = "alexander@ejemplo.com",
                Sexo = false,
                Estado = true
            };

            var cliente3 = new Cliente()
            {
                Id = 3,
                Dni = "41414141",
                ApellidoPaterno = "Marinelli",
                ApellidoMaterno = "Carmona",
                Nombres = "Jhon",
                FechaNacimiento = DateTime.Parse("1987-06-12"),
                Direccion = "Av. Martires de Uchuracay #256",
                Telefono = "RPC 945123625",
                Email = "jhon@ejemplo.com",
                Sexo = true,
                Estado = false
            };

            context.Clientes.Add(cliente1);
            context.Clientes.Add(cliente2);
            context.Clientes.Add(cliente3);
            context.SaveChanges();

            Console.WriteLine("Base de Datos Creada...OK!!");
            Console.ReadLine();

        }
    }
}
