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

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
