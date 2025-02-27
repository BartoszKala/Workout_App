﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ProjektWPF.Models
{
    //Klasa reprezentująca obiekt user
    public class User
    {
        [Column("user_id")] //alias z bazy danych
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        [Column("birth_date")]
        public DateTime? BirthDate { get; set; } 
        public string Gender { get; set; } //w bazie jest enum ale normalnie dziala przy przypisaniu jako string
        public float? Weight { get; set; }
        public float? Height { get; set; }
        [Column("total_workouts")]
        public int TotalWorkouts { get; set; }
        [Column("total_calories_burned")]
        public int TotalCaloriesBurned { get; set; }
        [Column("total_time_spent")]
        public int TotalTimeSpent { get; set; }
        [Column("join_date")]
        public DateTime JoinDate { get; set; }
        [Column("last_login")]
        public DateTime LastLogin { get; set; }

        //Funkcja pomocnicza (potem do usunięcia)
        public override string ToString()
        {
            return $"{UserId}, {Username}, {Password}, {Email}, {BirthDate}, {Gender}, {Weight}, {Height}, {TotalWorkouts}, {TotalCaloriesBurned}, {TotalTimeSpent}, {JoinDate}, {LastLogin}";
        }
        public User(int userId, string username, string password, string email, DateTime? birthDate, string gender, float? weight, float? height, int totalWorkouts, int totalCaloriesBurned, int totalTimeSpent, DateTime joinDate, DateTime lastLogin)
        {
            UserId = userId;
            Username = username;
            Password = password;
            Email = email;
            BirthDate = birthDate;
            Gender = gender;
            Weight = weight;
            Height = height;
            TotalWorkouts = totalWorkouts;
            TotalCaloriesBurned = totalCaloriesBurned;
            TotalTimeSpent = totalTimeSpent;
            JoinDate = joinDate;
            LastLogin = lastLogin;
        }
    }
}
