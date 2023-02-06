using estimate_teck.DTO;
using estimate_teck.Data;
using estimate_teck.Models;
using Microsoft.EntityFrameworkCore;

namespace estimate_teck.Servicies.Empleados
{
    public class EmpleadoServices: IEmpleado
    {
        private readonly estimate_teckContext _context;
        public EmpleadoServices( estimate_teckContext  context)
        {
            _context= context;
        }

        public async Task<IEnumerable<empleadoDto>> GetEmployees()
        {
           
            var resultEmployee = await
                (
                from empleoyee in _context.Empleados
                join cargo in _context.Cargos on empleoyee.CargoId equals cargo.CargoId
                select new empleadoDto
                {
                    Cargo = cargo.Nombre,
                   /* Nombre = empleoyee.Nombre.ToString(),
                    Apellido= empleoyee.Apellido.ToString(),*/
                    NombreCompleto= string.Concat(empleoyee.Nombre, empleoyee.Apellido)

                }).ToListAsync();
            return resultEmployee;
        }
    }
}
