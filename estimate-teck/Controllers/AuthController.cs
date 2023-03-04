using estimate_teck.DTO;
using estimate_teck.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;

namespace estimate_teck.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {

        //private estimate_teckContext db = new estimate_teckContext();
        public static Usuario usuario = new Usuario();
        private readonly IUsuarioService _usuarioService;
        private readonly IConfiguration _configuration;

        public AuthController(IConfiguration configuration, IUsuarioService usuarioService)
        {
            _configuration = configuration;
            _usuarioService= usuarioService;
        }


        [HttpGet, Authorize]
        //Por medio de este metodo se pueden visualizar las claims en el controlador

        public ActionResult<string> GetMe()
        {
            //---METODO UTILIZANDO SERVICES ---
            var userName = _usuarioService.GetMyName();
            return Ok(userName);

            //----METODO SIN UTILIZAR SERVICES---

            /*var userName = User?.Identity?.Name;
            var userName2 = User.FindFirstValue(ClaimTypes.Name);
            var role = User.FindFirstValue(ClaimTypes.Role);
            return Ok(new {userName, userName2, role});*/
        }

        [HttpPost("registrar")]

        public async Task<ActionResult<Usuario>> Register(UsuarioDto request)
        {
            CreatePasswordHash(request.Password, out byte[] passwordHash, out byte[] passeordSalt);

            //REVISAR PARA PODER USAR EL EMAIL REAL Que VENGA DEL EMPLEADO, YA QUE EL CAMPO
            //LLAMADO EEMAL LO AGREGUE YO


            usuario.EEmail = request.Username;
            usuario.PasswordHast = passwordHash;
            usuario.PasswordSalt = passeordSalt;



            return Ok(usuario);
        }

        [HttpPost("Login")]
        public async Task<ActionResult<string>> Login(UsuarioDto request)
        {
            if (usuario.EEmail != request.Username)
            {
                return BadRequest("Usuario incorrecto");
            }

            if (!VerifyPasswordHash(request.Password, usuario.PasswordHast, usuario.PasswordSalt))
            {
                return BadRequest("Contrasena incorrecta");
            }



            string token = CreateToken(usuario);

            return Ok(token);
        }

        private string CreateToken(Usuario usuario)
        {
            List<Claim> claims = new List<Claim>
            {

                new Claim(ClaimTypes.Name, usuario.EEmail),

                new Claim(ClaimTypes.Role, "Admin")

            };

            var key = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(
                _configuration.GetSection("AppSettings:Token").Value));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.Now.AddDays(1),
                signingCredentials: creds);

            var jwt = new JwtSecurityTokenHandler().WriteToken(token);


            return jwt;
        }

        private void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512())
            {
                passwordSalt = hmac.Key;
                passwordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));

            }
        }

        private bool VerifyPasswordHash(string password, byte[] passwordHash, byte[] passeordSalt)
        {
            using (var hmac = new HMACSHA512(usuario.PasswordSalt))
            {
                var computeHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return computeHash.SequenceEqual(passwordHash);

            }
        }
    }
}
