import styles from '../../css/dashboardcontent.module.css'
import EmpDashboard from './EmpDashboard'
import EmpMessagesServices from './EmpMessagesServices'

export default function DashboardContent({employees,messages,services}) {
    return <div>

        <h1 className={styles.dHead}>Welcome to the dashboard</h1>
        <main>

            <div className={styles.goalsCols}>
                <div className={styles.dContent}>

                    <h2>Total Clients</h2>
                    <h3>200</h3>
                </div>
                <div className={styles.dContent}>
                    <h2> Active Clients</h2>
                    <h3>150</h3>
                </div>
                <div className={styles.dContent}>

                    <h2>Active Admins</h2>
                    <h3>5</h3>
                </div>
                <div className={styles.dContent}>

                    <h2>Pending Tickets</h2>
                    <h3>20</h3>
                </div>
                <div className={styles.dContent}>

                    <h2>Demo Requests</h2>
                    <h3>60</h3>
                </div>
                <div className={styles.dContent}>

                    <h2>All Messages</h2>
                    <h3>50</h3>
                </div>
            </div>

            <EmpMessagesServices messages={messages} services={services}/>
           
            <div>
                <h2 className={styles.recentH3}>Quick Service</h2>

             <div className={styles.qCols}>
                    <div><button className={styles.Qbtn}>All Messages</button></div>
                    <div><button className={styles.Qbtn}>All Services</button></div>
                    <div className={styles.dContent}>

                        <h2>Billing errors</h2>
                        <h3>10</h3>
                  </div>
                
                </div>
                
            </div>
          
            <EmpDashboard employees={employees} messages={messages}/>

        </main>



    </div>
}