using System.ComponentModel.DataAnnotations;
using System;

namespace SystemHotel.Domain.Entities
{
    public abstract class EntityBase
    {
        [Required]
        public Guid Id { get; set; }

        [Display(Name = "Название(заголовк)")]
        public virtual string Title { get; set; }

        [Display(Name = "SEO метатен Title")]
        public string MetaTitle { get; set; }

        [Display(Name = "SEO метатег Keywords")]
        public string MetaKeywords { get; set; }
    }
}
