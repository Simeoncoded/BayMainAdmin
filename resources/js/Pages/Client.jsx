import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { useState } from "react";
import styles from "../../css/clients.module.css";

export default function Client({ auth, clients }) {
    const [search, setSearch] = useState("");

    const handleSearch = (e) => {
        setSearch(e.target.value);
    };

    const filteredClients = clients.filter(
        (client) =>
            client.name.toLowerCase().includes(search.toLowerCase()) ||
            client.email.toLowerCase().includes(search.toLowerCase()) ||
            client.industry.toLowerCase().includes(search.toLowerCase())
    ); 
    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                    Client Management
                </h2>
            }
        >
            <form action="" className={styles.searchForm}>
                <input
                    type="text"
                    placeholder="Search..."
                    className={styles.Searchfield}
                    onChange={handleSearch}
                    value={search}
                />
            </form>
            <table className={styles.customers}>
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Industry</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {filteredClients.length > 0 ? (
                        filteredClients.map((client, index) => (
                            <tr key={index}>
                                <td>{client.name}</td>
                                <td>{client.email}</td>
                                <td>{client.industry}</td>
                                <td>
                                    <button className={styles.viMore}>
                                        View More
                                    </button>
                                </td>
                            </tr>
                        ))
                    ) : (
                        <tr>
                            <td colSpan="4" style={{ textAlign: "center" }}>
                                No clients found
                            </td>
                        </tr>
                    )}
                </tbody>
            </table>
        </AuthenticatedLayout>
    );
}
