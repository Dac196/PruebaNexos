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
    
    public class PacientesController : Controller
    {
        
        private Models.MyDBContext db;
        public PacientesController(Models.MyDBContext context)
        {
            db = context;
        }
        //Metodo para consultaro todos los pacientes
        [HttpGet("[action]")]
        public IEnumerable<PacienteViewModel> ConsultarPacientes()
        {
            List<PacienteViewModel> lst = (from p in db.Paciente
                                           select new PacienteViewModel
                                           {
                                               Id = p.Id,
                                               Nombre = p.Nombre,
                                               NumeroDeSeguroSocial = p.NumeroDeSeguroSocial,
                                               CodigoPostal = p.CodigoPostal,
                                               Telefono = p.Telefono,
                                               CedulaDoctor = p.CedulaDoctor


                                           }).ToList();
            return lst;
        }

        //Metodo para insertar nuevos usuarios
        [HttpPost("[action]")]
        public Response AddPaciente([FromBody]PacienteViewModel model)
        {
            Response oR = new Response();
            
            try
            {
                Models.Paciente oPaciente = new Models.Paciente
                {
                    Nombre = model.Nombre,
                    NumeroDeSeguroSocial = model.NumeroDeSeguroSocial,
                    CodigoPostal = model.CodigoPostal,
                    Telefono = model.Telefono,
                    CedulaDoctor = model.CedulaDoctor
                };
                db.Paciente.Add(oPaciente);
                db.SaveChanges();

                oR.Succes = 1;
            }
            catch (Exception ex) {
                oR.Succes = 0;
                oR.Message = ex.Message;
            }
            return oR;
        }


        //Metodo para modificar ususarios
        [HttpPut("[action]")]
        public Response ModPaciente([FromBody]PacienteViewModel model)
        {
            Response oR = new Response();
            try
            {
                Models.Paciente oPaciente = db.Paciente.Find(model.Id);

                oPaciente.Nombre = model.Nombre;
                oPaciente.NumeroDeSeguroSocial = model.NumeroDeSeguroSocial;
                oPaciente.CodigoPostal = model.CodigoPostal;
                oPaciente.Telefono = model.Telefono;
                oPaciente.CedulaDoctor = model.CedulaDoctor;

                db.Entry(oPaciente).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                db.SaveChanges();

                oR.Succes = 1;
            }
            catch (Exception ex)
            {
                oR.Succes = 0;
                oR.Message = ex.Message;
            }
            return oR;
        }



        //Metodo para Eliminar ususarios
        [HttpDelete("{id}")]
        public Response DelPaciente(int Id)
        {
            Response oR = new Response();
            try
            {
                Models.Paciente oPaciente = db.Paciente.Find(Id);
                db.Remove(oPaciente);
                db.SaveChanges();
                oR.Succes = 1;
            }
            catch (Exception ex)
            {
                oR.Succes = 0;
                oR.Message = ex.Message;
            }
            return oR;
        }



    }
}