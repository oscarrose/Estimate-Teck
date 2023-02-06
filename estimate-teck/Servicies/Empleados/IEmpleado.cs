using estimate_teck.DTO;

namespace estimate_teck.Servicies.Empleados
{
    public interface IEmpleado
    {
        // Method for get all the employees
        Task<IEnumerable<empleadoDto>> GetEmployees();
    }
}
