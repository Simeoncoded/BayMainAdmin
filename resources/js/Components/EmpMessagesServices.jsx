import styles from '../../css/dashboardcontent.module.css';

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
                                <li key={service.id} style={{
                                    borderBottom: '1px solid #ddd', // Adds a bottom border for separation
                                    padding: '10px', // Adds padding around the content
                                    marginBottom: '10px', // Adds space between items
                                    backgroundColor: '#f9f9f9', // Light background color for contrast
                                    borderRadius: '5px', // Rounded corners
                                    transition: 'background-color 0.3s ease' // Smooth transition for background color change
                                }}>
                                    <a href="#" className={styles.recentPostLink} style={{
                                        textDecoration: 'none', // Removes underline from link
                                        color: '#333', // Dark text color for better readability
                                        display: 'block', // Ensures the entire area is clickable
                                        fontSize: '14px', // Sets a readable font size
                                        fontWeight: 'normal' // Ensures normal font weight
                                    }}>
                                        <strong style={{ color: '#007BFF' }}>ID:</strong> {service.id} 
                                        <strong style={{ color: '#007BFF' }}> Service Code:</strong> {service.service_code}  
                                        <strong style={{ color: '#007BFF' }}> Solution:</strong> {service.solution}
                                        <strong style={{ color: '#007BFF' }}> Description:</strong> {service.description}
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
                                <li key={message.id} style={{
                                    borderBottom: '1px solid #ddd', // Adds a bottom border for separation
                                    padding: '10px', // Adds padding around the content
                                    marginBottom: '10px', // Adds space between items
                                    backgroundColor: '#f9f9f9', // Light background color for contrast
                                    borderRadius: '5px', // Rounded corners
                                    transition: 'background-color 0.3s ease', // Smooth transition for background color change
                                }}>
                                    <a href="#" className={styles.recentCommentLink} style={{
                                        textDecoration: 'none', // Removes underline from link
                                        color: '#333', // Dark text color for better readability
                                        display: 'block', // Ensures the entire area is clickable
                                        fontSize: '14px', // Sets a readable font size
                                        fontWeight: 'normal' // Ensures normal font weight
                                    }}>
                                        <strong style={{ color: '#007BFF' }}>ID:</strong> {message.id} 
                                        <strong style={{ color: '#007BFF' }}> Name:</strong> {message.name}  
                                        <strong style={{ color: '#007BFF' }}> Email:</strong> {message.email}
                                        <strong style={{ color: '#007BFF' }}> Message:</strong> {message.message}
                                    </a>
                                </li>
                                
                            ))}
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    );
}
