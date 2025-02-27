﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Media;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using Pomelo.EntityFrameworkCore.MySql.Storage.Internal;
using ProjektWPF.Core;
using ProjektWPF.Data;
using ProjektWPF.Models;

namespace ProjektWPF.ViewModels
{
    //Klasa główna odpowiedzialna za spięcie wszystkich innych viewmodeli i zarządzanie nimi
    public class MainViewModel : ViewModelBase
    {
        //ViewModele do poszczególnych podstron
        public LoginViewModel LoginVm { get; set; }
        public RegisterViewModel RegisterVm { get; set; }
        public ProfileViewModel ProfileVm { get; set; }
        public ExercisesViewModel ExercisesVm { get; set; }
        public WorkoutsViewModel WorkoutsVm { get; set; }
        public SessionViewModel SessionVm { get; set; }
        public ProgressViewModel ProgressVm { get; set; }
        public WorkoutsAddViewModel WorkoutsAddVm { get; set; }
        public WorkoutModifyViewModel WorkoutModifyVm { get; set; }
        public WorkoutMenageExercisesViewModel WorkoutMenageExercisesVm { get; set; }
        public SelectedExerciseViewModel SelectedExerciseVm { get; set; }
        public ProfileEditViewModel ProfileEditVm { get; set; }
        public ProfileChangePasswordViewModel ProfilePasswordVm { get; set; }
        public NewMeasurementViewModel NewMeasurementVm { get; set; }
        public MeasurementViewModel MeasurementVm { get; set; }
        public TrainingHistoryViewModel TrainingHistoryVm { get; set; }
        public ConnectionErrorViewModel ConnectionErrorVm { get; set; }

        // Deklaracja RelayCommand do przycisków -------------------
        public RelayCommand LoginViewCommand { get; set; }
        public RelayCommand RegisterViewCommand { get; set; }
        public RelayCommand ProfileViewCommand { get; set; }
        public RelayCommand ExercisesViewCommand { get; set; }
        public RelayCommand WorkoutsViewCommand { get; set; }
        public RelayCommand ProgressViewCommand { get; set; }
        public RelayCommand MeasurementViewCommand { get; set; }
        public RelayCommand TrainingHistoryViewCommand { get; set; }
        //public RelayCommand SessionViewCommand { get; set; }


        //Aktualny widok
        private object _currentView;
        public object CurrentView
        {
            get { return _currentView; }
            set 
            { 
                _currentView = value; 
                OnPropertyChanged(nameof(CurrentView));
            }
        }
        public MainViewModel() 
        {
            //Podpięcie śledzenia zmian w ID usera z sesji
            ConnectionErrorVm = new ConnectionErrorViewModel();
            UserSession.UserIdChanged += OnUserIdChanged;
            UserSession.SqlError += OnSqlError;
            try
            {
                LoginVm = new LoginViewModel();
                RegisterVm = new RegisterViewModel();
                ProfileVm = new ProfileViewModel(this);
                ExercisesVm = new ExercisesViewModel(this);
                WorkoutsVm = new WorkoutsViewModel(this);
                //SessionVm = new SessionViewModel(null);
                ProgressVm = new ProgressViewModel(this);
                WorkoutsAddVm = new WorkoutsAddViewModel(this);
                WorkoutModifyVm = new WorkoutModifyViewModel(this);
                WorkoutMenageExercisesVm = new WorkoutMenageExercisesViewModel(this);
                SelectedExerciseVm = new SelectedExerciseViewModel(this);
                ProfileEditVm = new ProfileEditViewModel(this);
                ProfilePasswordVm = new ProfileChangePasswordViewModel(this);
                NewMeasurementVm = new NewMeasurementViewModel(this);
                MeasurementVm = new MeasurementViewModel();
                TrainingHistoryVm = new TrainingHistoryViewModel();


                LoginViewCommand = new RelayCommand(arg => { CurrentView = LoginVm; }, null);
                RegisterViewCommand = new RelayCommand(arg => { CurrentView = RegisterVm; }, null);
                ProfileViewCommand = new RelayCommand(arg => { CurrentView = ProfileVm; }, null);
                ExercisesViewCommand = new RelayCommand(arg => { CurrentView = ExercisesVm; ExercisesVm.ClearFilters(); }, null);
                WorkoutsViewCommand = new RelayCommand(arg => { CurrentView = WorkoutsVm; WorkoutsVm.Update(); }, null);
                ProgressViewCommand = new RelayCommand(arg => { CurrentView = ProgressVm; }, null);
                MeasurementViewCommand = new RelayCommand(arg => { CurrentView = MeasurementVm; }, null);
                TrainingHistoryViewCommand = new RelayCommand(arg => { CurrentView = TrainingHistoryVm; }, null);
                //SessionViewCommand = new RelayCommand(arg => { CurrentView = SessionVm; }, null);


                //Ustawienie poczatkowego widoku na ekran logowania
                CurrentView = LoginVm;
                LoginFrontButton = true;
                ProfileFrontButton = true;

                //przed zalogowaniem ustawiam zmienną CurrentUserId na null
                //POLECAM DO TESTOW USTAWIAC NA DOWOLNE ID WTEDY TRAKTUJE JAK ZALOGOWANEGO
                UserSession.CurrentUserId = null;
                UserSession.CurrentUserWeight = true;
                UserSession.CurrentUserTrainingAdded = 0;

                //Testy !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                //DbWorkoutPlans.UpdateWorkoutData(1); //Działa !
            } 
            catch(InvalidOperationException ex)
            {
                UserSession.CurrentSqlError += 1; //Jesli po uruchomieniu aplikacji serwer nie dziala to przelacza na okno z informacją o tym
            }
        }

        private void OnSqlError(int? error)
        {
            CurrentView = ConnectionErrorVm;
        }

        //Funkcja reagująca na zamiany w id usera (sprawdza czy jestesmy zalogowani czy nie)
        private void OnUserIdChanged(int? newUserId)
        {

            // Zmiana widoczności
            if (newUserId != null)
            {
                LogRegVisibility = Visibility.Collapsed;
                LogOutVisibility = Visibility.Visible;
                CurrentView = ProfileVm;
            }
            else
            {
                LogRegVisibility = Visibility.Visible;
                LogOutVisibility = Visibility.Collapsed;
            }

            if (UserSession.CurrentUserWeight == true)
            {
                UserSession.CurrentUserWeight = false;
            }
            else
            {
                UserSession.CurrentUserWeight = true;
            }
        }

        //Zmiany panelu bocznego przy zalogowaniu i po wylogowaniu 
        private Visibility _logRegVisibility = Visibility.Visible;
        public Visibility LogRegVisibility
        {
            get { return _logRegVisibility; }
            set
            {
                _logRegVisibility = value;
                OnPropertyChanged(nameof(LogRegVisibility));
            }
        }
        private Visibility _logOutVisibility = Visibility.Collapsed;
        public Visibility LogOutVisibility
        {
            get { return _logOutVisibility; }
            set
            {
                _logOutVisibility = value;
                OnPropertyChanged();
            }
        }

        //Wylogowywanie sie
        private ICommand _logOutClick;
        public ICommand LogOutClick
        {
            get
            {
                if (_logOutClick == null)
                {
                    _logOutClick = new RelayCommand(
                        arg => { LogOut(); }, null);
                }

                return _logOutClick;
            }
        }
        private void LogOut()
        {
            UserSession.CurrentUserId = null; //Po wylogowaniu id aktualnego uzytkownika ustawiamy na null
            
            CurrentView = LoginVm; //Wracamy rowniez do widoku logowania
            LoginFrontButton = true;
            ProfileFrontButton = true;
        }

        public void CheangeViewToSessionView(WorkoutPlan wp) // <-- Funkcja potrzeba aby WorkoutsViewModel mógł zmienić CurrentView na SessionVm
        {
            SessionVm = new SessionViewModel(wp,this);
            CurrentView = SessionVm;
        }

        public void CheangeViewToWorkoutAddPanel()
        {
            CurrentView = WorkoutsAddVm;
        }

        public void CheangeViewToWorkoutsPanel()
        {
            WorkoutsVm.Update();
            CurrentView = WorkoutsVm;
        }
        public void CheangeViewToWorkoutModifyPanel(WorkoutPlan wp)
        {
            WorkoutModifyVm.LoadDataToModify(wp);
            CurrentView = WorkoutModifyVm;
        }

        public void ChangeViewToWorkoutMenageExercisesPanel(WorkoutPlan wp)
        {
            WorkoutMenageExercisesVm.LoadWorkoutExercises(wp);
            CurrentView = WorkoutMenageExercisesVm;
        }

        public void ChangerViewToSelectedExercise()
        {
            CurrentView = SelectedExerciseVm;
        }

        public void ChangeViewToProfileEdit()
        {
            CurrentView = ProfileEditVm;
        }

        public void ChangeViewToProfilePasswordEdit()
        {
            CurrentView = ProfilePasswordVm;
        }

        public void ChangeViewToProfile()
        {
            CurrentView = ProfileVm;
        }

        public void ChangeViewToExercises()
        {
            CurrentView= ExercisesVm;
        }

        public void ChangeViewToProgress()
        {
            CurrentView = ProgressVm;
        }

        public void ChangeViewToNewMeasurement()
        {
            CurrentView = NewMeasurementVm;
        }

        //Sterowanie zaznaczeniem buttonów
        private bool _loginFrontButton;
        public bool LoginFrontButton
        {
            get { return _loginFrontButton; }
            set
            {
                _loginFrontButton = value;
                OnPropertyChanged();
            }
        }

        private bool _profileFrontButton;
        public bool ProfileFrontButton
        {
            get { return _profileFrontButton; }
            set
            {
                _profileFrontButton = value;
                OnPropertyChanged();
            }
        }
    }
}
