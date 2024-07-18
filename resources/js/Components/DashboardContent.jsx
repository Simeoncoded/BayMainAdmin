import styles from '../../css/dashboardcontent.module.css'

export default function DashboardContent(){
    return <div>

<h1 className={styles.dHead}>Welcome to the dashboard</h1>
         <main className={styles.goalsCols}>
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
    </main>

    </div>
}