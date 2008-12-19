namespace WorkOrder
{
    partial class NewOrder
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblTitle = new System.Windows.Forms.Label();
            this.txtTitle = new System.Windows.Forms.TextBox();
            this.lblDesc = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.lblCreation = new System.Windows.Forms.Label();
            this.lblCreationDate = new System.Windows.Forms.Label();
            this.lblUser = new System.Windows.Forms.Label();
            this.lblCreatorUser = new System.Windows.Forms.Label();
            this.LblState = new System.Windows.Forms.Label();
            this.cbxState = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.cbxEmployee = new System.Windows.Forms.ComboBox();
            this.btnSend = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblTitle
            // 
            this.lblTitle.AutoSize = true;
            this.lblTitle.Location = new System.Drawing.Point(22, 30);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(30, 13);
            this.lblTitle.TabIndex = 0;
            this.lblTitle.Text = "Title:";
            // 
            // txtTitle
            // 
            this.txtTitle.Location = new System.Drawing.Point(109, 23);
            this.txtTitle.Name = "txtTitle";
            this.txtTitle.Size = new System.Drawing.Size(114, 20);
            this.txtTitle.TabIndex = 1;
            // 
            // lblDesc
            // 
            this.lblDesc.AutoSize = true;
            this.lblDesc.Location = new System.Drawing.Point(22, 59);
            this.lblDesc.Name = "lblDesc";
            this.lblDesc.Size = new System.Drawing.Size(63, 13);
            this.lblDesc.TabIndex = 2;
            this.lblDesc.Text = "Description:";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(109, 59);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(114, 45);
            this.textBox1.TabIndex = 3;
            // 
            // lblCreation
            // 
            this.lblCreation.AutoSize = true;
            this.lblCreation.Location = new System.Drawing.Point(22, 166);
            this.lblCreation.Name = "lblCreation";
            this.lblCreation.Size = new System.Drawing.Size(72, 13);
            this.lblCreation.TabIndex = 4;
            this.lblCreation.Text = "Creation Date";
            // 
            // lblCreationDate
            // 
            this.lblCreationDate.AutoSize = true;
            this.lblCreationDate.Location = new System.Drawing.Point(109, 166);
            this.lblCreationDate.Name = "lblCreationDate";
            this.lblCreationDate.Size = new System.Drawing.Size(0, 13);
            this.lblCreationDate.TabIndex = 5;
            // 
            // lblUser
            // 
            this.lblUser.AutoSize = true;
            this.lblUser.Location = new System.Drawing.Point(22, 197);
            this.lblUser.Name = "lblUser";
            this.lblUser.Size = new System.Drawing.Size(44, 13);
            this.lblUser.TabIndex = 6;
            this.lblUser.Text = "Creator:";
            // 
            // lblCreatorUser
            // 
            this.lblCreatorUser.AutoSize = true;
            this.lblCreatorUser.Location = new System.Drawing.Point(109, 196);
            this.lblCreatorUser.Name = "lblCreatorUser";
            this.lblCreatorUser.Size = new System.Drawing.Size(0, 13);
            this.lblCreatorUser.TabIndex = 7;
            // 
            // LblState
            // 
            this.LblState.AutoSize = true;
            this.LblState.Location = new System.Drawing.Point(22, 224);
            this.LblState.Name = "LblState";
            this.LblState.Size = new System.Drawing.Size(61, 13);
            this.LblState.TabIndex = 8;
            this.LblState.Text = "Order State";
            // 
            // cbxState
            // 
            this.cbxState.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxState.Enabled = false;
            this.cbxState.FormattingEnabled = true;
            this.cbxState.Location = new System.Drawing.Point(109, 221);
            this.cbxState.Name = "cbxState";
            this.cbxState.Size = new System.Drawing.Size(121, 21);
            this.cbxState.TabIndex = 9;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(25, 128);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(72, 13);
            this.label1.TabIndex = 10;
            this.label1.Text = "To Employee:";
            // 
            // cbxEmployee
            // 
            this.cbxEmployee.FormattingEnabled = true;
            this.cbxEmployee.Location = new System.Drawing.Point(109, 119);
            this.cbxEmployee.Name = "cbxEmployee";
            this.cbxEmployee.Size = new System.Drawing.Size(121, 21);
            this.cbxEmployee.TabIndex = 11;
            // 
            // btnSend
            // 
            this.btnSend.Location = new System.Drawing.Point(25, 318);
            this.btnSend.Name = "btnSend";
            this.btnSend.Size = new System.Drawing.Size(75, 23);
            this.btnSend.TabIndex = 12;
            this.btnSend.Text = "Send";
            this.btnSend.UseVisualStyleBackColor = true;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(112, 317);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 13;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            // 
            // NewOrder
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(448, 369);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnSend);
            this.Controls.Add(this.cbxEmployee);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cbxState);
            this.Controls.Add(this.LblState);
            this.Controls.Add(this.lblCreatorUser);
            this.Controls.Add(this.lblUser);
            this.Controls.Add(this.lblCreationDate);
            this.Controls.Add(this.lblCreation);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.lblDesc);
            this.Controls.Add(this.txtTitle);
            this.Controls.Add(this.lblTitle);
            this.Name = "NewOrder";
            this.Text = "NewOrder";
            this.Load += new System.EventHandler(this.NewOrder_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitle;
        private System.Windows.Forms.TextBox txtTitle;
        private System.Windows.Forms.Label lblDesc;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label lblCreation;
        private System.Windows.Forms.Label lblCreationDate;
        private System.Windows.Forms.Label lblUser;
        private System.Windows.Forms.Label lblCreatorUser;
        private System.Windows.Forms.Label LblState;
        private System.Windows.Forms.ComboBox cbxState;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbxEmployee;
        private System.Windows.Forms.Button btnSend;
        private System.Windows.Forms.Button btnCancel;
    }
}