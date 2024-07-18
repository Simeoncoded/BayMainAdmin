import React, { useState } from 'react';
import styles from '../../css/employee.module.css';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';

export default function Employee({ auth, employees }) {
  const [showForm, setShowForm] = useState(false);
  const [newEmployee, setNewEmployee] = useState({
    name: '', salary: '', email: '', password: '', image: '', token: '',
    role: '', skills: '', deployment: '', employment_type: '', contact: '',
    address: '', salary_bank: '', salary_account: ''
  });
  const [selectedEmployee, setSelectedEmployee] = useState(null);

  const addEmployee = () => {
    setShowForm(true);
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewEmployee({ ...newEmployee, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const newEmployeeWithId = { ...newEmployee, id: employees.length + 1, salary: parseFloat(newEmployee.salary) };
    setEmployees([...employees, newEmployeeWithId]);
    setShowForm(false);
    setNewEmployee({
      name: '', salary: '', email: '', image: '', token: '',
      role: '', skills: '', deployment: '', employment_type: '', contact: '',
      address: '', salary_bank: '', salary_account: ''
    });
  };

  const deleteEmployee = (id) => {
    setEmployees(employees.filter(employee => employee.id !== id));
  };

  const viewMore = (id) => {
    const employee = employees.find(employee => employee.id === id);
    setSelectedEmployee(employee);
  };

  const closeViewMore = () => {
    setSelectedEmployee(null);
  };

  return (
    <AuthenticatedLayout
      user={auth.user}
      header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Employee Management</h2>}
    >
      <div className={styles.container}>
        <h1>Employee Management</h1>
        <button onClick={addEmployee} className={styles.addButton}>Add New Employee</button>
        
        {/* Form to add new employee */}
        {showForm && (
          <form onSubmit={handleSubmit} className={styles.form}>
            <input
              type="text"
              name="name"
              placeholder="Name"
              value={newEmployee.name}
              onChange={handleInputChange}
              required
            />
            <input
              type="number"
              name="salary"
              placeholder="Salary"
              value={newEmployee.salary}
              onChange={handleInputChange}
              required
            />
            <input
              type="email"
              name="email"
              placeholder="Email"
              value={newEmployee.email}
              onChange={handleInputChange}
              required
            />
            <input
              type="text"
              name="role"
              placeholder="Role"
              value={newEmployee.role}
              onChange={handleInputChange}
              required
            />
            <input
              type="text"
              name="skills"
              placeholder="Skills"
              value={newEmployee.skills}
              onChange={handleInputChange}
              required
            />
            <input
              type="text"
              name="deployment"
              placeholder="Deployment"
              value={newEmployee.deployment}
              onChange={handleInputChange}
              required
            />
            <input
              type="text"
              name="employment_type"
              placeholder="Employment Type"
              value={newEmployee.employment_type}
              onChange={handleInputChange}
              required
            />
            <input
              type="text"
              name="contact"
              placeholder="Contact"
              value={newEmployee.contact}
              onChange={handleInputChange}
              required
            />
            <input
              type="text"
              name="address"
              placeholder="Address"
              value={newEmployee.address}
              onChange={handleInputChange}
              required
            />
            <input
              type="text"
              name="salary_bank"
              placeholder="Salary Bank"
              value={newEmployee.salary_bank}
              onChange={handleInputChange}
              required
            />
            <input
              type="text"
              name="salary_account"
              placeholder="Salary Account"
              value={newEmployee.salary_account}
              onChange={handleInputChange}
              required
            />
            <button type="submit" className={styles.submitButton}>Submit</button>
          </form>
        )}

        {/* Display Employees */}
        <table className={styles.employeeTable}>
          <thead>
            <tr>
              <th>Name</th>
              <th>Position</th>
              <th>Salary</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {employees.map(employee => (
              <tr key={employee.id}>
                <td>{employee.name}</td>
                <td>{employee.role}</td>
                <td>{employee.salary}</td>
                <td>
                  <button onClick={() => viewMore(employee.id)} className={styles.viewMoreButton}>View More</button>
                  <button onClick={() => deleteEmployee(employee.id)} className={styles.deleteButton}>Delete</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>

              {/* Employee Details */}
        {selectedEmployee && (
          <div className={styles.modal}>
            <div className={styles.modalContent}>
              <span className={styles.closeButton} onClick={closeViewMore}>&times;</span>
              <h2>{selectedEmployee.name}</h2>
              <p><strong>Email:</strong> {selectedEmployee.email}</p>
              <p><strong>Contact:</strong> {selectedEmployee.contact}</p>
              <p><strong>Address:</strong> {selectedEmployee.address}</p>
              <p><strong>Role:</strong> {selectedEmployee.role}</p>
              <p><strong>Skills:</strong> {selectedEmployee.skills}</p>
              <p><strong>Deployment:</strong> {selectedEmployee.deployment}</p>
              <p><strong>Employment Type:</strong> {selectedEmployee.employment_type}</p>
              <p><strong>Salary Bank:</strong> {selectedEmployee.salary_bank}</p>
              <p><strong>Salary Account:</strong> {selectedEmployee.salary_account}</p>
              <p><strong>Created At:</strong> {selectedEmployee.created_at}</p>
              <p><strong>Updated At:</strong> {selectedEmployee.updated_at}</p>
            </div>
          </div>
        )}

      </div>
    </AuthenticatedLayout>
  );
}
