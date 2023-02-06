using estimate_teck.Data;
using estimate_teck.Servicies.Empleados;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace estimate_teck.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmpleadosController : ControllerBase
    {
        private readonly estimate_teckContext _context;
        private readonly IEmpleado _servicesEmployee;
        public EmpleadosController(estimate_teckContext context, IEmpleado servicesEmployee)
        {
            _context=context;
            _servicesEmployee = servicesEmployee;
        }

        [HttpGet("AllEmployee")]
        public async Task<IActionResult> GetEmployee()
        {
            if (_context.Empleados == null) return NotFound();

            return Ok( await _servicesEmployee.GetEmployees());

        }

    }
}
