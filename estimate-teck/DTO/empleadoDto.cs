namespace estimate_teck.DTO
{
    public class empleadoDto
    {
        //public int EmpleadoId { get; set; }
        public string Estado { get; set; }
        public string Cargo { get; set; }
        public string Nombre { get; set; } = null!;
        public string Apellido { get; set; } = null!;
        public string NombreCompleto { get; set; } = null!;
        public string Identifiacion { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string? TelefonoRedidencial { get; set; }
        public string Celular { get; set; } = null!;
        public string Ciudad { get; set; } = null!;
        public string Calle { get; set; } = null!;
        public string Sector { get; set; } = null!;
        public DateTime? FechaCreacion { get; set; }
    }
}
