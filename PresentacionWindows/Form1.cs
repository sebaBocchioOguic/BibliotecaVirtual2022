﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PresentacionWindows
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            TraerAutores();
        }

        void TraerAutores()
        {
            Logica.Autor logicaAutor = new Logica.Autor();
            dgvAutores.DataSource = logicaAutor.TraerTodos();

        }
    }
}
