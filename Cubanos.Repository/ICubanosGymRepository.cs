using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.BusinessEntity;

namespace Cubanos.Repository
{
    public interface ICubanosGymRepository
    {
        //Cliente
        IEnumerable<Cliente> listarClientes(String criterio); //listar Cliente
        void InsertarCliente(Cliente cliente); //Registrar Cliente
        Cliente GetCliente(Int32 idCliente);
        Cliente GetClientePorDni(String dni);
        void Actualizar(Cliente cliente);//Actualizar Cliente
        void EliminarCliente(Int32 IdCliente); //Eliminar cliente
        //.........................................................

        //Paquete
        IEnumerable<Paquete> ListarPaquete(String criterio, DateTime? fechaInicio, DateTime? fechaFin);
        //.........................................................

        //Plan
        IEnumerable<Plan> ListarPlan(Int32 clienteId);
        //.........................................................

        //Rutina
        IEnumerable<Rutina> ListarRutina(Int32 planId);
        //.........................................................

        //Empleado
        IEnumerable<Empleado> ListarEmpleado(String criterio);
        void InsertarEmpleado(Empleado empleado);
        //.........................................................

        //Rutina
        IEnumerable<DetalleEjercicioToRutina> ListarEjercicios(Int32 ejerciciosId);
        //.........................................................

    }
}
