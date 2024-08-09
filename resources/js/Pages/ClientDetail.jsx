import React, { useState } from "react";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { UserIcon } from '@heroicons/react/24/outline'


const Modal = ({ isOpen, onClose, client, onUpdate }) => {
    const [formData, setFormData] = useState(client);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData({ ...formData, [name]: value });
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        onUpdate(formData);
        onClose();
    };

    if (!isOpen) return null;

    return (
        <div className="fixed z-10 inset-0 overflow-y-auto">
            <div className="flex items-center justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                <div className="fixed inset-0 transition-opacity" aria-hidden="true">
                    <div className="absolute inset-0 bg-gray-500 opacity-75"></div>
                </div>
                <span className="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
                <div className="inline-block align-bottom bg-white dark:bg-gray-800 rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:align-middle sm:max-w-lg sm:w-full">
                    <form onSubmit={handleSubmit}>
                        <div className="bg-white dark:bg-gray-800 px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                            <h3 className="text-lg leading-6 font-medium text-gray-900 dark:text-gray-200 mb-4">Edit Client Details</h3>
                            <div className="grid grid-cols-1 gap-y-3">
                                {Object.keys(formData).map((key) => (
                                    key !== 'avatarUrl' ? (
                                        <div key={key}>
                                            <label htmlFor={key} className="block text-sm font-medium text-gray-700 dark:text-gray-300">
                                                {key.charAt(0).toUpperCase() + key.slice(1)}
                                            </label>
                                            <input
                                                type={key === 'joinDate' ? 'date' : 'text'}
                                                name={key}
                                                id={key}
                                                value={key === 'joinDate' ? formData[key].split('T')[0] : formData[key]}
                                                onChange={handleChange}
                                                className="mt-1 p-2 border border-gray-300 dark:border-gray-700 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 block w-full sm:text-sm dark:bg-gray-700 dark:text-gray-300"
                                                readOnly={key === 'clientId'} 
                                            />
                                        </div>
                                    ) : null
                                ))}
                            </div>
                        </div>
                        <div className="bg-gray-50 dark:bg-gray-800 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                            <button
                                type="submit"
                                className="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-600 text-base font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm"
                            >
                                Save
                            </button>
                            <button
                                type="button"
                                onClick={onClose}
                                className="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white dark:bg-gray-700 text-base font-medium text-gray-700 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:mt-0 sm:w-auto sm:text-sm"
                            >
                                Cancel
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
};

export default function ClientDetail({ auth }) {
    const [client, setClient] = useState({
        name: "Jane Doe",
        subscribedPlan: "Gold",
        clientId: "78901",
        industry: "Finance",
        email: "janedoe@example.com",
        phone: "+1 (234) 567-8901",
        address: "456 Elm St, Springfield, USA",
        joinDate: "2024-07-15",
        avatarUrl: "https://via.placeholder.com/100", 
    });

    const [isModalOpen, setIsModalOpen] = useState(false);

    const handleUpdate = (updatedClient) => {
        setClient(updatedClient);
    };

    const handleDelete = () => {
        alert("Delete functionality is not implemented yet.");
    };

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                    Client Detail
                </h2>
            }
        >
            <div className="max-w-4xl mx-auto py-8 px-6">
                <div className="bg-white dark:bg-gray-800 shadow overflow-hidden sm:rounded-lg">
                    <div className="px-4 py-5 sm:px-6 flex items-center justify-between">
                        <div className="flex items-center">
                            {}
                            <UserIcon className="h-16 w-16 text-gray-500 dark:text-gray-400 mr-4" />
                            <div>
                                <h3 className="text-lg leading-6 font-medium text-gray-900 dark:text-gray-200">
                                    Client Information
                                </h3>
                                <p className="mt-1 max-w-2xl text-sm text-gray-500 dark:text-gray-400">
                                    Personal details and application.
                                </p>
                            </div>
                        </div>
                        <div className="flex space-x-3">
                            <button
                                onClick={() => setIsModalOpen(true)}
                                className="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
                            >
                                Update
                            </button>
                            <button
                                onClick={handleDelete}
                                className="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500"
                            >
                                Delete
                            </button>
                        </div>
                    </div>
                    <div className="border-t border-gray-200 dark:border-gray-700">
                        <dl>
                            <div className="bg-gray-50 dark:bg-gray-700 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt className="text-sm font-medium text-gray-500 dark:text-gray-400">Name</dt>
                                <dd className="mt-1 text-sm text-gray-900 dark:text-gray-200 sm:mt-0 sm:col-span-2">{client.name}</dd>
                            </div>
                            <div className="bg-white dark:bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt className="text-sm font-medium text-gray-500 dark:text-gray-400">Subscribed Plan</dt>
                                <dd className="mt-1 text-sm text-gray-900 dark:text-gray-200 sm:mt-0 sm:col-span-2">{client.subscribedPlan}</dd>
                            </div>
                            <div className="bg-gray-50 dark:bg-gray-700 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt className="text-sm font-medium text-gray-500 dark:text-gray-400">Client ID</dt>
                                <dd className="mt-1 text-sm text-gray-900 dark:text-gray-200 sm:mt-0 sm:col-span-2">{client.clientId}</dd>
                            </div>
                            <div className="bg-white dark:bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt className="text-sm font-medium text-gray-500 dark:text-gray-400">Industry</dt>
                                <dd className="mt-1 text-sm text-gray-900 dark:text-gray-200 sm:mt-0 sm:col-span-2">{client.industry}</dd>
                            </div>
                            <div className="bg-gray-50 dark:bg-gray-700 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt className="text-sm font-medium text-gray-500 dark:text-gray-400">Email</dt>
                                <dd className="mt-1 text-sm text-gray-900 dark:text-gray-200 sm:mt-0 sm:col-span-2">{client.email}</dd>
                            </div>
                            <div className="bg-white dark:bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt className="text-sm font-medium text-gray-500 dark:text-gray-400">Phone Number</dt>
                                <dd className="mt-1 text-sm text-gray-900 dark:text-gray-200 sm:mt-0 sm:col-span-2">{client.phone}</dd>
                            </div>
                            <div className="bg-gray-50 dark:bg-gray-700 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt className="text-sm font-medium text-gray-500 dark:text-gray-400">Address</dt>
                                <dd className="mt-1 text-sm text-gray-900 dark:text-gray-200 sm:mt-0 sm:col-span-2">{client.address}</dd>
                            </div>
                            <div className="bg-white dark:bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt className="text-sm font-medium text-gray-500 dark:text-gray-400">Date Joined</dt>
                                <dd className="mt-1 text-sm text-gray-900 dark:text-gray-200 sm:mt-0 sm:col-span-2">{client.joinDate}</dd>
                            </div>
                        </dl>
                    </div>
                </div>
            </div>

            {}
            <Modal isOpen={isModalOpen} onClose={() => setIsModalOpen(false)} client={client} onUpdate={handleUpdate} />
        </AuthenticatedLayout>
    );
}
