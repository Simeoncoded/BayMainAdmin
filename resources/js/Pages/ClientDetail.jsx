import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { useEffect, useState } from "react";

export default function ClientDetail({ auth , client}) {
    // const [client, setClient] = useState(null);

    // useEffect(() => {
    //     const clientData = localStorage.getItem('clientDetail');
    //     if (clientData) {
    //         setClient(JSON.parse(clientData));
    //     }
    // }, []);

    if (!client) {
        return (
            <AuthenticatedLayout
                user={auth.user}
                header={
                    <h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                        Client Detail
                    </h2>
                }
            >
                <div>Loading...</div>
            </AuthenticatedLayout>
        );
    }

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                    Client Detail
                </h2>
            }
        >
            <div>
                <h3>Name: {client.name}</h3>
                <p>Email: {client.email}</p>
                <p>Industry: {client.industry}</p>
                <p>Phone: {client.phone}</p>
                <p>Address: {client.address}</p>
            </div>
        </AuthenticatedLayout>
    );
}
