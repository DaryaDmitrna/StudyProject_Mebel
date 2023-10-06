using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace MebelCourseWPF.Models
{
    public partial class mebelContext : DbContext
    {
        public mebelContext()
        {
        }

        public mebelContext(DbContextOptions<mebelContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Character> Character { get; set; }
        public virtual DbSet<Client> Client { get; set; }
        public virtual DbSet<Managers> Managers { get; set; }
        public virtual DbSet<NewProduct> NewProduct { get; set; }
        public virtual DbSet<NewproductCharacter> NewproductCharacter { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<Parametr> Parametr { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<Status> Status { get; set; }
        public virtual DbSet<Type> Type { get; set; }
        public virtual DbSet<TypeChracter> TypeChracter { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=(localdb)\\MSSQLLocalDB;Database=mebel;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Character>(entity =>
            {
                entity.HasKey(e => e.IdCharacter);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Client>(entity =>
            {
                entity.HasKey(e => e.IdClient);

                entity.Property(e => e.Adres).HasMaxLength(50);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Managers>(entity =>
            {
                entity.HasKey(e => e.IdManager);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<NewProduct>(entity =>
            {
                entity.HasKey(e => e.IdNewProduct);

                entity.HasOne(d => d.IdOrderNavigation)
                    .WithMany(p => p.NewProduct)
                    .HasForeignKey(d => d.IdOrder)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_NewProduct_Order1");

                entity.HasOne(d => d.IdProductNavigation)
                    .WithMany(p => p.NewProduct)
                    .HasForeignKey(d => d.IdProduct)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_NewProduct_Product");
            });

            modelBuilder.Entity<NewproductCharacter>(entity =>
            {
                entity.HasKey(e => e.IdNewProductCharacter);

                entity.HasOne(d => d.IdCharacterNavigation)
                    .WithMany(p => p.NewproductCharacter)
                    .HasForeignKey(d => d.IdCharacter)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_NewproductCharacter_Character");

                entity.HasOne(d => d.IdNewProductNavigation)
                    .WithMany(p => p.NewproductCharacter)
                    .HasForeignKey(d => d.IdNewProduct)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_NewproductCharacter_NewProduct");

                entity.HasOne(d => d.IdParametrNavigation)
                    .WithMany(p => p.NewproductCharacter)
                    .HasForeignKey(d => d.IdParametr)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_NewproductCharacter_Parametr");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.HasKey(e => e.IdOrder);

                entity.Property(e => e.DateAccept).HasColumnType("date");

                entity.Property(e => e.DateDeliver).HasColumnType("date");

                entity.Property(e => e.DateExacute).HasColumnType("date");

                entity.Property(e => e.Number)
                    .IsRequired()
                    .HasColumnName("number")
                    .HasMaxLength(50);

                entity.Property(e => e.Prepayment).HasColumnType("money");

                entity.Property(e => e.Sum).HasColumnType("money");

                entity.HasOne(d => d.IdClientNavigation)
                    .WithMany(p => p.Order)
                    .HasForeignKey(d => d.IdClient)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Order_Client");

                entity.HasOne(d => d.IdStatusNavigation)
                    .WithMany(p => p.Order)
                    .HasForeignKey(d => d.IdStatus)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Order_Status");
            });

            modelBuilder.Entity<Parametr>(entity =>
            {
                entity.HasKey(e => e.IdParametr);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Price).HasColumnType("money");

                entity.HasOne(d => d.IdCharacterNavigation)
                    .WithMany(p => p.Parametr)
                    .HasForeignKey(d => d.IdCharacter)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Parametr_Character");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(e => e.IdProduct);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Price).HasColumnType("money");

                entity.HasOne(d => d.IdTypeNavigation)
                    .WithMany(p => p.Product)
                    .HasForeignKey(d => d.IdType)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_Type");
            });

            modelBuilder.Entity<Status>(entity =>
            {
                entity.HasKey(e => e.IdStatus);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Type>(entity =>
            {
                entity.HasKey(e => e.IdType);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<TypeChracter>(entity =>
            {
                entity.HasKey(e => e.IdTypeCharacter);

                entity.HasOne(d => d.IdCharacterNavigation)
                    .WithMany(p => p.TypeChracter)
                    .HasForeignKey(d => d.IdCharacter)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TypeChracter_Character");

                entity.HasOne(d => d.IdTypeNavigation)
                    .WithMany(p => p.TypeChracter)
                    .HasForeignKey(d => d.IdType)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TypeChracter_Type");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
