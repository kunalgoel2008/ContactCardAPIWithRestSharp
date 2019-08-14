using Contact.DataAccess.IRepositories;
using Contact.DataAccess.Models;
using Contact.DataAccess.Repositories;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contact.DataAccess.UnitOfWork
{
    public class UnitOfWork:IUnitOfWork
    {
        private DbContext _dbContext;
        private  IRepository<user> _userRepository;
        private  IRepository<address> _userAddressRepository;
        private  IRepository<organisation> _userOrganisationRepository;
        private  IRepository<position> _userPositionRepository;
        public UnitOfWork(DbContext context)
        {
            _dbContext = context;
        }
        public IRepository<user> userRepository
        {
            get
            {

                if (this._userRepository == null)
                {
                    this._userRepository = new Repository<user>(_dbContext);
                }
                return _userRepository;
            }
        }

        public IRepository<address> userAddressRepository
        {
            get
            {

                if (this._userAddressRepository == null)
                {
                    this._userAddressRepository = new Repository<address>(_dbContext);
                }
                return _userAddressRepository;
            }
        }

        public IRepository<organisation> userOrganisationRepository
        {
            get
            {

                if (this._userOrganisationRepository == null)
                {
                    this._userOrganisationRepository = new Repository<organisation>(_dbContext);
                }
                return _userOrganisationRepository;
            }
        }
        public IRepository<position> userPositionRepository
        {
            get
            {

                if (this._userPositionRepository == null)
                {
                    this._userPositionRepository = new Repository<position>(_dbContext);
                }
                return _userPositionRepository;
            }
        }
        public void Save()
        {
            _dbContext.SaveChanges();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _dbContext.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}

