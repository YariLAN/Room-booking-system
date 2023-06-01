using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SystemHotel.Models
{
    public class CategoryModel : SettlementsAbstractModel
    {
        public CategoryModel(int id, string name) : base(id, name) { }
        public CategoryModel() : base() { }

        public async Task<List<CategoryModel>> GetCategories()
        {
            return await _dbContext.Categotyofhotels.Select
                (s => new CategoryModel(s.CategoryId, s.CategoryValue)).ToListAsync();
        }

        //public Categotyofhotels GetCategoryById(int id)
        //{
        //    var cat = _dbContext.Countries.FirstOrDefault(r => r.CountryId == id);
        //    return new CountriesModel(country.CountryId, country.CountryName);
        //}
    }
}
