using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaNexos.Models.ViewModels
{
    public class PacienteViewModel
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int NumeroDeSeguroSocial { get; set; }
        public int CodigoPostal { get; set; }
        public int Telefono { get; set; }
        public string CedulaDoctor { get; set; }
    }
}
