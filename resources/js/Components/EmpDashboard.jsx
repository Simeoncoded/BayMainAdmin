import styles from '../../css/employee.module.css';

import React from 'react';

export default function EmpDashboard({ employees }) {
  return (
    <div>
      <h2 className={styles.empDH}>All Employees</h2>

      <table className={styles.employeeTable}>
          <thead>
            <tr>
                <th>ID</th>
              <th>Name</th>
              <th>Position</th> 
              <th>Contact</th>
              {/* <th>Status</th> */}   
            </tr>
          </thead>
          <tbody>
            {employees.map(employee => (
              <tr key={employee.id}>
                <td>{employee.id}</td>
                <td>{employee.name}</td>
                <td>{employee.role}</td>
                <td>{employee.salary}</td>

              </tr>
            ))}
          </tbody>
        </table>
    </div>
  );
}