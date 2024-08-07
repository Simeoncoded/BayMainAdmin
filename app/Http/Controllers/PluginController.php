<?php

namespace App\Http\Controllers;

use App\Models\Plugins;
use Illuminate\Http\Request;
use Exception;

class PluginController extends Controller
{
    public function create(Request $request)
    {
        try {
            Plugins::create(
                $request->validate([
                    'plugin_code' => ['required', 'string', 'max:255'],
                    'image' => ['required', 'string', 'max:255'],
                    'solution' => ['required', 'string'],
                    'description' => ['required', 'string'],
                    'long_description' => ['required', 'string'],
                    'documentation_url' => ['required', 'url'],
                    'amount' => ['required', 'numeric'],
                    'version' => ['required', 'string'],
                    'vendor' => ['required', 'string', 'max:255']
                ])
            );
        } catch (Exception $e) {
            // Handle exception as needed, e.g., logging or returning an error response
            return response()->json(['error' => $e->getMessage()], 500);
        }

        return redirect()->route('plan'); // Adjust the route name as needed
    }

    public function delete(Request $request, $id)
    {
        $plugin = Plugins::find($id);

        if ($plugin) {
            $plugin->delete();
            return response()->json(['message' => 'Plugin deleted successfully']);
        } else {
            return response()->json(['error' => 'Plugin not found'], 404);
        }
    }
}
