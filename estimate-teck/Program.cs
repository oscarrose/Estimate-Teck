using estimate_teck.Data;
using estimate_teck.Servicies.Empleados;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

//get connexion
builder.Services.AddDbContext<estimate_teckContext>(options =>
options.UseSqlServer(builder.Configuration.GetConnectionString("connectionEstimate")));

//Add injecting dependency

builder.Services.AddScoped<IEmpleado, EmpleadoServices>();

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
