namespace SystemHotel.Models
{
    public abstract class SettlementsAbstractModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public readonly HotelContext _dbContext = new HotelContext();

        public SettlementsAbstractModel() {}
        public SettlementsAbstractModel(int id, string name)
        {
            this.Id = id;
            this.Name = name;
        }
        public SettlementsAbstractModel(HotelContext dbContext)
        {
            this._dbContext = dbContext;
        }
    }
}
