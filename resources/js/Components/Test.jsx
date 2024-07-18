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

export default function Test({employees}) {
  return (
    <div>
      <h1>This is test</h1>
      <ul>
        {employees.map((employee) => (
          <li key={employee.id}>{employee.name}</li>
        ))}
      </ul>
    </div>
  );
}

