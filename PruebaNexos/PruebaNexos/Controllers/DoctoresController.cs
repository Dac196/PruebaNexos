using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using PruebaNexos.Models.Response;
using PruebaNexos.Models.ViewModels;

namespace PruebaNexos.Controllers
{
    [Route("api/[controller]")]
    public class DoctoresController : Controller
    {
        private Models.MyDBContext db;

        public DoctoresController(Models.MyDBContext context)
        {
            db = context;
        }

        //Metodo para consultaro todos los Doctores
        [HttpGet("[action]")]
        public IEnumerable<DoctorViewModel> ConsultarDoctores()
        {
            List<DoctorViewModel> lst = (from d in db.Doctor
                                           select new DoctorViewModel
                                           {
                                               Id = d.Id,
                                               Nombre = d.Nombre,
                                               NumeroDeCredencial= d.NúmeroDeCredencial,
                                               Hospital= d.Hospital
                                            
                                           }).ToList();
            return lst;
        }


    }
}