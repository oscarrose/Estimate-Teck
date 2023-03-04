using System.Security.Claims;

namespace estimate_teck.Servicies.UsuariosTk
{
    public class UsuarioService:IUsuarioService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        public UsuarioService(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public string GetMyName()
        {
            var result = string.Empty;
            if (_httpContextAccessor.HttpContext != null)
            {
                result = _httpContextAccessor.HttpContext.User.FindFirstValue(ClaimTypes.Name);
            }

            return result;  
        }
    }
}
