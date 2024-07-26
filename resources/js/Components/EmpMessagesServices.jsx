import styles from '../../css/dashboardcontent.module.css'

export default function EmpMessagesServices({ messages, services }) {
    return (
        <div>


            <div className={styles.recent}>
                <h1 className={styles.recentH}>Recent Services Purchased</h1>
                <div className={styles.recentContent1}>
                    <div className={styles.recentPost}>
                        <h2 className={styles.recentH2}>Recent Services</h2>
                        <ol>
                            {services.map((service) => (
                                <li key={service.id}>
                                    <a href="#" className={styles.recentPostLink}>
                                        <strong>.ID: </strong>{service.id}
                                        <strong> .Service Code:</strong> {service.service_code}  <strong> Solution:</strong> {service.solution}
                                        <strong> Description:</strong> {service.description}
                                    </a>
                                </li>
                            ))}




                        </ol>
                    </div>
                </div>
            </div>


            <div className={styles.recent}>
                <h1 className={styles.recentH}>Recent Messages</h1>
                <div className={styles.recentContent1}>
                    <div className={styles.recentPost}>
                        <h2 className={styles.recentH2}>Recent Messages</h2>
                        <ol>
                            {messages.map((message) => (
                                <li key={message.id}>
                                    <a href="#" className={styles.recentPostLink}>
                                        <strong>.ID: </strong>{message.id}
                                        <strong> .Name:</strong> {message.name}  <strong> Email:</strong> {message.email}
                                        <strong> Message:</strong> {message.message}
                                    </a>
                                </li>
                            ))}




                        </ol>
                    </div>
                </div>
            </div>

        </div>
    )
}