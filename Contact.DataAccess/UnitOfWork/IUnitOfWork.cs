using Contact.DataAccess.IRepositories;
using Contact.DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contact.DataAccess.UnitOfWork
{
    public interface IUnitOfWork: IDisposable
    {
        IRepository<user> userRepository { get; }
        IRepository<address> userAddressRepository { get; }
        IRepository<organisation> userOrganisationRepository { get; }
        IRepository<position> userPositionRepository { get; }
        void Save();
    }
}
