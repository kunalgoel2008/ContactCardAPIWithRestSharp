using Contact.DataAccess.Models;
using Contact.DataAccess.IRepositories;
using Contact.API.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using Contact.DataAccess.UnitOfWork;

namespace Contact.WebAPI.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UserController : ApiController, IContact
    {
        private IUnitOfWork _unitOfWork;
        public UserController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }


        [HttpGet]
        [Route("getUsers/{id}")]
        public  IHttpActionResult GetUsersByID(string id)
        {
            try
            {
                bool containsInt = id.Any(char.IsDigit);
                if (containsInt)
                {
                   
                    var users = _unitOfWork.userRepository.GetByID(Convert.ToInt32(id));
                    var Useraddress = new address()
                    {

                        id = users.address.id,
                        address_type = users.address.address_type,
                        state_id = users.address.state_id,
                        pincode = users.address.pincode,
                        street = users.address.street,
                        street_2 = users.address.street_2 ?? ""
                    };
                    var data = new user();
                    data.id = users.id;
                    data.first_name = users.first_name;
                    data.last_name = users.last_name;
                    data.isDeleted = users.isDeleted;
                    data.mob_no = users.mob_no;
                    data.organisation_id = users.organisation_id;
                    data.position_id = users.position_id;
                    data.alt_mob_no = users.alt_mob_no;
                    data.email = users.email;
                    data.address_id = users.address_id;
                    data.address = Useraddress;
                    return Ok(data);
                }
                else
                {
                    return BadRequest();
                }
            }
            catch(Exception ex)
            {               
                return NotFound();
            }
               
        }

        [HttpGet]
        [Route("getAllUsers")]
        public IHttpActionResult GetAllUsers()
        {
            try
            {
                var users = _unitOfWork.userRepository.GetAll().ToList();
                var data = users.Where(x=>x.isDeleted == null || x.isDeleted == false).Select(x => new
                {
                    Id = x.id,
                    FirstName = x.first_name,
                    LastName = x.last_name,
                    isDeleted = x.isDeleted,
                    MobileNo = x.mob_no,
                    OrgansationID = x.organisation_id,
                    PositionID = x.position_id,
                    Alt_MobileNO = x.alt_mob_no,
                    Email = x.email,
                    AddressID = x.address_id

                }).ToList();
                return Ok(data);
            }
            catch(Exception ex)
            {
                return NotFound();
            }
           
        }

        [HttpDelete]
        [Route("deleteUsers/{id}")]
        public IHttpActionResult DeleteUsers(string id)
        {
            try
            {
                bool containsInt = id.Any(char.IsDigit);
                if (containsInt)
                {
                    _unitOfWork.userRepository.Delete(Convert.ToInt32(id));
                    _unitOfWork.Save();
                    return Ok(200);
                }
                else
                {
                    return BadRequest();
                }
            }
            catch
            {
              return  NotFound();
            }
            
        }
        [HttpPost]
        [Route("createUser")]
        public IHttpActionResult CreateUsers([FromBody]user user)
        {
            try
            {
                if (user!=null)
                {
                    _unitOfWork.userAddressRepository.Insert(user.address);
                    _unitOfWork.userRepository.Insert(user);
                    _unitOfWork.Save();
                    return Ok();
                }
                else
                {
                    return BadRequest();
                }
            }
            catch(Exception ex)
            {
                return NotFound();
            }

        }
        [HttpPut]
        [Route("updateUser")]
        public IHttpActionResult UpdateUsers([FromBody]user user)
        {
            try
            {              
                if (user != null)
                {

                    _unitOfWork.userAddressRepository.Update(user.address);
                    _unitOfWork.userRepository.Update(user);
                    _unitOfWork.Save();
                    return Ok();
                }
                else
                {
                    return BadRequest();
                }

            }
            catch (Exception ex)
            {
                return NotFound();
            }

        }
    }
}
