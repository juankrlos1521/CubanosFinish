using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Cubanos.BusinessEntity;
using Cubanos.Repository;
using Microsoft.Practices.Unity;


namespace Cubanos.Service
{
    public class CubanosGymService : ICubanosGymService
    {
        [Dependency]
        public ICubanosGymRepository _cubanosGymRepository { get; set; }              

        //cliente
        public IEnumerable<Cliente> listarClientes(string criterio)     // Listar Cliente
        {
           return _cubanosGymRepository.listarClientes(criterio);
        }

        public void InsertarCliente(Cliente cliente)     // Registrar Cliente
        {
            _cubanosGymRepository.InsertarCliente(cliente);
        }

       public Cliente GetCliente(Int32 idCliente) 
        {
            return _cubanosGymRepository.GetCliente(idCliente);
        }
       public Cliente GetClientePorDni(String dni) 
       {
           return _cubanosGymRepository.GetClientePorDni(dni);
       }

        public void Actualizar(Cliente cliente) 
        {
            _cubanosGymRepository.Actualizar(cliente);
        }

        public void EliminarCliente(Int32 IdCliente) 
        {
            _cubanosGymRepository.EliminarCliente(IdCliente);
        }


        //...........................................................

        //Paquete
        public IEnumerable<Paquete> ListarPaquete(string criterio, DateTime? fechaInicio, DateTime? fechaFin)
        {
            return _cubanosGymRepository.ListarPaquete(criterio, fechaInicio, fechaFin);
        }
        //............................................................

        //Plan
        public IEnumerable<Plan> ListarPlan(Int32 clienteId)
        {
            return _cubanosGymRepository.ListarPlan(clienteId);
        }
        //.............................................................

        //Empleado
        public IEnumerable<Empleado> ListarEmpleado(string criterio)   //Listar empleado
        {
            return _cubanosGymRepository.ListarEmpleado(criterio);
        }

        public void InsertarEmpleado(Empleado empleado)     //Registrar Empleado
        {
            _cubanosGymRepository.InsertarEmpleado(empleado);
        }
        //............................................................

        //rutina
        public IEnumerable<Rutina> ListarRutina(int planId)
        {
            return _cubanosGymRepository.ListarRutina(planId);
        }
        //..............................................................

        //Ejercicios
        public IEnumerable<DetalleEjercicioToRutina> ListarEjercicios(Int32 ejerciciosId)
        {
            return _cubanosGymRepository.ListarEjercicios(ejerciciosId);
        }
        //............................................................


    }
}
