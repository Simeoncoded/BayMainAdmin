import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";

export default function clientDetail({ auth, clients }) {
    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                    Client Detail
                </h2>
            }
        >
        
      
            {clients.map((client) => (
            <div>
                {client.name}
            </div>
            ))}
             
        </AuthenticatedLayout>
    );
}
