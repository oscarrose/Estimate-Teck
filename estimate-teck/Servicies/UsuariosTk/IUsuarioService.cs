namespace estimate_teck.Servicies.UsuariosTk
{
    public interface IUsuarioService
    {
        string GetMyName();

        /// <summary>
        /// method to verify the user is state activo
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        bool UserActive(int userId);
    }

   
}
