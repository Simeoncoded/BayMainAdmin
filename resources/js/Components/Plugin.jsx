import React, { useState } from "react";
import styles from '../../css/plan.module.css';
import { router } from "@inertiajs/react";

export default function Plugin({ plugins: initialPlugins }) {
    const [plugins, setPlugins] = useState(initialPlugins);
    const [newPlugin, setNewPlugin] = useState({
        plugin_code: '',
        image: '',
        solution: '',
        description: '',
        long_description: '',
        documentation_url: '',
        amount: '',
        version: '',
        vendor: ''
    });

    const handleAddPlugin = async (e) => {
        e.preventDefault();
        try {
            const response = await router.post("/plugin/create", newPlugin);
            const addedPlugin = response.data; 
            setPlugins([...plugins, addedPlugin]);

            setNewPlugin({
                plugin_code: '',
                image: '',
                solution: '',
                description: '',
                long_description: '',
                documentation_url: '',
                amount: '',
                version: '',
                vendor: ''
            });
        } catch (error) {
            console.error("Failed to add plugin:", error);
        }
    };

    const deletePlugin = async (id) => {
        try {
            await router.post(`/plugin/delete/${id}`);
            setPlugins(plugins.filter(plugin => plugin.id !== id));
        } catch (error) {
            console.error("Failed to delete plugin:", error);
        }
    };

    return (
        <div>
            <h3>Plugins List</h3>
            <table className={styles.table}>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Code</th>
                        <th>Image</th>
                        <th>Solution</th>
                        <th>Description</th>
                        <th>Long Description</th>
                        <th>Documentation URL</th>
                        <th>Amount</th>
                        <th>Version</th>
                        <th>Vendor</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {plugins.map(plugin => (
                        <tr key={plugin.id}>
                            <td>{plugin.id}</td>
                            <td>{plugin.plugin_code}</td>
                            <td><img src={plugin.image} alt={plugin.plugin_code} width="50" /></td>
                            <td>{plugin.solution}</td>
                            <td>{plugin.description}</td>
                            <td>{plugin.long_description}</td>
                            <td><a href={plugin.documentation_url} target="_blank" rel="noopener noreferrer">Documentation</a></td>
                            <td>{plugin.amount}</td>
                            <td>{plugin.version}</td>
                            <td>{plugin.vendor}</td>
                            <td>
                                <button
                                    onClick={() => deletePlugin(plugin.id)}
                                    className={styles.deleteButton}
                                >
                                    Delete
                                </button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>

            <h3>Add New Plugin</h3>
            <form onSubmit={handleAddPlugin} className={styles.form}>
                <input 
                    type="text" 
                    placeholder="Plugin Code" 
                    value={newPlugin.plugin_code} 
                    onChange={(e) => setNewPlugin({ ...newPlugin, plugin_code: e.target.value })} 
                    required 
                />
                <input 
                    type="text" 
                    placeholder="Image URL" 
                    value={newPlugin.image} 
                    onChange={(e) => setNewPlugin({ ...newPlugin, image: e.target.value })} 
                />
                <input 
                    type="text" 
                    placeholder="Solution" 
                    value={newPlugin.solution} 
                    onChange={(e) => setNewPlugin({ ...newPlugin, solution: e.target.value })} 
                />
                <input 
                    type="text" 
                    placeholder="Description" 
                    value={newPlugin.description} 
                    onChange={(e) => setNewPlugin({ ...newPlugin, description: e.target.value })} 
                />
                <input 
                    type="text" 
                    placeholder="Long Description" 
                    value={newPlugin.long_description} 
                    onChange={(e) => setNewPlugin({ ...newPlugin, long_description: e.target.value })} 
                />
                <input 
                    type="url" 
                    placeholder="Documentation URL" 
                    value={newPlugin.documentation_url} 
                    onChange={(e) => setNewPlugin({ ...newPlugin, documentation_url: e.target.value })} 
                />
                <input 
                    type="number" 
                    placeholder="Amount" 
                    value={newPlugin.amount} 
                    onChange={(e) => setNewPlugin({ ...newPlugin, amount: e.target.value })} 
                />
                <input 
                    type="text" 
                    placeholder="Version" 
                    value={newPlugin.version} 
                    onChange={(e) => setNewPlugin({ ...newPlugin, version: e.target.value })} 
                />
                <input 
                    type="text" 
                    placeholder="Vendor" 
                    value={newPlugin.vendor} 
                    onChange={(e) => setNewPlugin({ ...newPlugin, vendor: e.target.value })} 
                />
                <button type="submit" className={styles.addButton}>Add Plugin</button>
            </form>
        </div>
    );
}
