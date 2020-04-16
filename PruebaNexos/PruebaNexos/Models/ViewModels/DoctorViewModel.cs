using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaNexos.Models.ViewModels
{
    public class DoctorViewModel
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int NumeroDeCredencial { get; set; }
        public string Hospital { get; set; }
    }
}
