using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaNexos.Models
{
    public class MyDBContext : DbContext
    {
        public MyDBContext(DbContextOptions<MyDBContext> options) : base(options)
        {

        }

        public DbSet<Doctor> Doctor { get; set; }
        public DbSet<Paciente> Paciente { get; set; }
    }
    public class Paciente
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int NumeroDeSeguroSocial { get; set; }
        public int CodigoPostal { get; set; }
        public int Telefono { get; set; }
        public string CedulaDoctor { get; set; }
    }

    public class Doctor
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int NúmeroDeCredencial { get; set; }
        public string Hospital { get; set; }

    }
}
