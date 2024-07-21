// import React, { useEffect } from 'react';

// export default function Test({ employees }) {  
//   useEffect(() => {
//     employees.forEach((employee) => {
//       console.log(employee.name);
//     });
//   }, [employees]);

//   return (
//     <div>
//       <h1>This is test</h1>
//       {/* <ul>
//         {employees.map((employee) => (
//           <li key={employee.id}>{employee.name}</li>
//         ))}
//       </ul> */}
//     </div>
//   );
// }


import React from 'react';

export default function Test({ employees, messages, services }) {
  console.log('Services Data:', services); // Debugging line

  return (
    <div>
      <h1>This is test</h1>
      
      <h2>Employees</h2>
      <ul>
        {employees.map((employee) => (
          <li key={employee.id}>{employee.name}</li>
        ))}
      </ul>

      <h2>Services</h2>
      <ul>
        {services.map((service) => (
          <li key={service.id}>{service.solution}</li>
        ))}
      </ul>
      
      <h2>Recent Contacts</h2>
      <ul>
        {messages.map((message) => (
          <li key={message.id}>
            <strong>Name:</strong> {message.name} <br />
            <strong>Email:</strong> {message.email} <br />
            <strong>Message:</strong> {message.message}
          </li>
        ))}
      </ul>
    </div>
  );
}


