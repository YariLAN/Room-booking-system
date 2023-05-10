using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace SystemHotel
{
    public partial class HotelContext : DbContext
    {
        public HotelContext() {}

        public HotelContext(DbContextOptions<HotelContext> options): base(options) {}

        public virtual DbSet<UsLoginAndPassword> UsLoginAndPasswords { get; set; }
        public virtual DbSet<UsMainData> UsMainDatas { get; set; }
        public virtual DbSet<BookedRoom> BookedRoom { get; set; }
        public virtual DbSet<Categotyofhotels> Categotyofhotels { get; set; }
        public virtual DbSet<Cities> Cities { get; set; }
        public virtual DbSet<Countries> Countries { get; set; }
        public virtual DbSet<Hotels> Hotels { get; set; }
        public virtual DbSet<NumbersOfHotel> NumbersOfHotel { get; set; }
        public virtual DbSet<Regions> Regions { get; set; }
        public virtual DbSet<TypeRoom> TypeRoom { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=Hotel; User Id=admin;Password=Post");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UsLoginAndPassword>(entity =>
            {
                entity.HasKey(e => e.UserId).HasName("us_login_and_password_pkey");

                entity.ToTable("us_login_and_password");

                entity.Property(e => e.UserId)
                    .HasColumnName("user_id")
                    .ValueGeneratedOnAdd();
                   
                entity.Property(e => e.Login)
                    .IsRequired()
                    .HasColumnName("login");

                entity.Property(e => e.Pass)
                    .IsRequired()
                    .HasColumnName("pass")
                    .HasMaxLength(64);
            });

            modelBuilder.Entity<UsMainData>(entity =>
            {
                //entity.HasNoKey();

                entity.ToTable("us_main_data");

                entity.HasIndex(e => e.FkUserId)
                    .HasName("us_main_data_fk_user_id_key")
                    .IsUnique();

                entity.Property(e => e.DateOfBirth)
                    .HasColumnName("date_of_birth")
                    .HasColumnType("date");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasColumnName("first_name")
                    .HasMaxLength(64);

                entity.Property(e => e.FkUserId).HasColumnName("fk_user_id");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasColumnName("last_name")
                    .HasMaxLength(64);

                entity.Property(e => e.MiddleName)
                    .HasColumnName("middle_name")
                    .HasMaxLength(64);

                entity.HasOne(d => d.FkUser)
                    .WithOne()
                    .HasForeignKey<UsMainData>(d => d.FkUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("us_main_data_fk_user_id_fkey");
            });

            modelBuilder.Entity<BookedRoom>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("booked_room");

                entity.Property(e => e.DateCheckIn)
                    .HasColumnName("date_check_in")
                    .HasColumnType("date");

                entity.Property(e => e.DateCheckOut)
                    .HasColumnName("date_check_out")
                    .HasColumnType("date");

                entity.Property(e => e.FkNumbersOfHotel).HasColumnName("fk_numbers_of_hotel");

                entity.Property(e => e.FkUserId).HasColumnName("fk_user_id");

                entity.HasOne(d => d.FkNumbersOfHotelNavigation)
                    .WithMany()
                    .HasForeignKey(d => d.FkNumbersOfHotel)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("booked_room_fk_numbers_of_hotel_fkey");

                entity.HasOne(d => d.FkUser)
                    .WithMany()
                    .HasForeignKey(d => d.FkUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("booked_room_fk_user_id_fkey");
            });

            modelBuilder.Entity<Categotyofhotels>(entity =>
            {
                entity.HasKey(e => e.CategoryId)
                    .HasName("categotyofhotels_pkey");

                entity.ToTable("categotyofhotels");

                entity.Property(e => e.CategoryId)
                    .HasColumnName("category_id")
                    .UseIdentityAlwaysColumn();

                entity.Property(e => e.CategoryValue)
                    .IsRequired()
                    .HasColumnName("category_value")
                    .HasMaxLength(10);
            });

            modelBuilder.Entity<Cities>(entity =>
            {
                entity.HasKey(e => e.CityId)
                    .HasName("cities_pkey");

                entity.ToTable("cities");

                entity.Property(e => e.CityId)
                    .HasColumnName("city_id")
                    .UseIdentityAlwaysColumn();

                entity.Property(e => e.CityName)
                    .IsRequired()
                    .HasColumnName("city_name")
                    .HasMaxLength(100);

                entity.Property(e => e.FkRegionId).HasColumnName("fk_region_id");

                entity.HasOne(d => d.FkRegion)
                    .WithMany(p => p.Cities)
                    .HasForeignKey(d => d.FkRegionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("cities_fk_region_id_fkey");
            });

            modelBuilder.Entity<Countries>(entity =>
            {
                entity.HasKey(e => e.CountryId)
                    .HasName("countries_pkey");

                entity.ToTable("countries");

                entity.Property(e => e.CountryId)
                    .HasColumnName("country_id")
                    .UseIdentityAlwaysColumn();

                entity.Property(e => e.CountryName)
                    .IsRequired()
                    .HasColumnName("country_name")
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<Hotels>(entity =>
            {
                entity.HasKey(e => e.HotelId)
                    .HasName("hotels_pkey");

                entity.ToTable("hotels");

                entity.Property(e => e.HotelId)
                    .HasColumnName("hotel_id")
                    .UseIdentityAlwaysColumn();

                entity.Property(e => e.FkCityId).HasColumnName("fk_city_id");

                entity.Property(e => e.FkCountryId).HasColumnName("fk_country_id");

                entity.Property(e => e.FkHotelCategory).HasColumnName("fk_hotel_category");

                entity.Property(e => e.FkRegionId).HasColumnName("fk_region_id");

                entity.Property(e => e.HotelName)
                    .IsRequired()
                    .HasColumnName("hotel_name")
                    .HasMaxLength(100);

                entity.Property(e => e.HouseNumber).HasColumnName("house_number");

                entity.Property(e => e.StreetName)
                    .IsRequired()
                    .HasColumnName("street_name")
                    .HasMaxLength(200);

                entity.HasOne(d => d.FkCity)
                    .WithMany(p => p.Hotels)
                    .HasForeignKey(d => d.FkCityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("hotels_fk_city_id_fkey");

                entity.HasOne(d => d.FkCountry)
                    .WithMany(p => p.Hotels)
                    .HasForeignKey(d => d.FkCountryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("hotels_fk_country_id_fkey");

                entity.HasOne(d => d.FkHotelCategoryNavigation)
                    .WithMany(p => p.Hotels)
                    .HasForeignKey(d => d.FkHotelCategory)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("hotels_fk_hotel_category_fkey");

                entity.HasOne(d => d.FkRegion)
                    .WithMany(p => p.Hotels)
                    .HasForeignKey(d => d.FkRegionId)
                    .HasConstraintName("hotels_fk_region_id_fkey");
            });

            modelBuilder.Entity<NumbersOfHotel>(entity =>
            {
                entity.HasKey(e => e.NumberId)
                    .HasName("numbers_of_hotel_pkey");

                entity.ToTable("numbers_of_hotel");

                entity.Property(e => e.NumberId)
                    .HasColumnName("number_id")
                    .UseIdentityAlwaysColumn();

                entity.Property(e => e.AmountSeats).HasColumnName("amount_seats");

                entity.Property(e => e.FkHotelId).HasColumnName("fk_hotel_id");

                entity.Property(e => e.FkTypeRoom).HasColumnName("fk_type_room");

                entity.Property(e => e.FloorNumber).HasColumnName("floor_number");

                entity.Property(e => e.Isavaiable).HasColumnName("isavaiable");

                entity.Property(e => e.NumberRoom).HasColumnName("number_room");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.HasOne(d => d.FkHotel)
                    .WithMany(p => p.NumbersOfHotel)
                    .HasForeignKey(d => d.FkHotelId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("numbers_of_hotel_fk_hotel_id_fkey");

                entity.HasOne(d => d.FkTypeRoomNavigation)
                    .WithMany(p => p.NumbersOfHotel)
                    .HasForeignKey(d => d.FkTypeRoom)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("numbers_of_hotel_fk_type_room_fkey");
            });

            modelBuilder.Entity<Regions>(entity =>
            {
                entity.HasKey(e => e.RegionId)
                    .HasName("regions_pkey");

                entity.ToTable("regions");

                entity.Property(e => e.RegionId)
                    .HasColumnName("region_id")
                    .UseIdentityAlwaysColumn();

                entity.Property(e => e.FkCountryId).HasColumnName("fk_country_id");

                entity.Property(e => e.RegionName)
                    .IsRequired()
                    .HasColumnName("region_name")
                    .HasMaxLength(200);

                entity.HasOne(d => d.FkCountry)
                    .WithMany(p => p.Regions)
                    .HasForeignKey(d => d.FkCountryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("regions_fk_country_id_fkey");
            });

            modelBuilder.Entity<TypeRoom>(entity =>
            {
                entity.ToTable("type_room");

                entity.Property(e => e.TypeRoomId)
                    .HasColumnName("type_room_id")
                    .UseIdentityAlwaysColumn();

                entity.Property(e => e.TypeRoomName)
                    .IsRequired()
                    .HasColumnName("type_room_name")
                    .HasMaxLength(100);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
