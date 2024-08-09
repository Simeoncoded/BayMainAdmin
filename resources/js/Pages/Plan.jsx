    import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
    import { useState } from "react";
    import styles from '../../css/plan.module.css';
    import Plugin from "@/Components/Plugin";

    export default function Plan({ auth, plans: initialPlans, plugins: initialPlugins }) {
        const [plans, setPlans] = useState(initialPlans);
        const [newPlan, setNewPlan] = useState({ plan_name: '', description: '', amount: '', paystack_plan_code: '', plan_type: '', active: true });
        const [plugins, setPlugins] = useState(initialPlugins);
        const [newPlugin, setNewPlugin] = useState({ plugin_name: '', image: '', solution: '', description: '', long_description: '', documentation_url: '', amount: '', version: '', vendor: '' });

        const handleAddPlan = async (e) => {
            e.preventDefault();
            // Add your API here to add a plan
            // setPlans([...plans, response.data]);
            setNewPlan({ plan_name: '', description: '', amount: '', paystack_plan_code: '', plan_type: '', active: true });
        };

        const handleDeletePlan = async (id) => {
            // Add your API here to delete a plan
            // setPlans(plans.filter(plan => plan.id !== id));
        };

        const handleAddPlugin = async (newPlugin) => {
            // Add your API here to add a plugin
            // setPlugins([...plugins, response.data]);
        };

   
        return (
            <AuthenticatedLayout
                user={auth.user}
                header={
                    <h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                        Plans Management
                    </h2>
                }
            >
                <div className={styles.container}>
                    <h3>Plans List</h3>
                    <table className={styles.table}>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Amount</th>
                                <th>Type</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            {plans.map(plan => (
                                <tr key={plan.id}>
                                    <td>{plan.id}</td>
                                    <td>{plan.plan_name}</td>
                                    <td>{plan.description}</td>
                                    <td>{plan.amount}</td>
                                    <td>{plan.plan_type}</td>
                                    <td>{plan.active ? 'Active' : 'Inactive'}</td>
                                    <td>
                                        <button onClick={() => handleDeletePlan(plan.id)} className={styles.deleteButton}>Delete</button>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                    
                    <h3>Add New Plan</h3>
                    <form onSubmit={handleAddPlan} className={styles.form}>
                        <input 
                            type="text" 
                            placeholder="Plan Name" 
                            value={newPlan.plan_name} 
                            onChange={(e) => setNewPlan({ ...newPlan, plan_name: e.target.value })} 
                            required 
                        />
                        <input 
                            type="text" 
                            placeholder="Description" 
                            value={newPlan.description} 
                            onChange={(e) => setNewPlan({ ...newPlan, description: e.target.value })} 
                        />
                        <input 
                            type="number" 
                            placeholder="Amount" 
                            value={newPlan.amount} 
                            onChange={(e) => setNewPlan({ ...newPlan, amount: e.target.value })} 
                            required 
                        />
                        <input 
                            type="text" 
                            placeholder="Paystack Code" 
                            value={newPlan.paystack_plan_code} 
                            onChange={(e) => setNewPlan({ ...newPlan, paystack_plan_code: e.target.value })} 
                        />
                        <input 
                            type="text" 
                            placeholder="Plan Type" 
                            value={newPlan.plan_type} 
                            onChange={(e) => setNewPlan({ ...newPlan, plan_type: e.target.value })} 
                        />
                        <button type="submit" className={styles.addButton}>Add Plan</button>
                    </form>

                    <Plugin plugins={plugins} onAddPlugin={handleAddPlugin} />
                </div>
            </AuthenticatedLayout>
        );
    }
