<?php

namespace App\Http\Controllers;

use App\Jobs\ProductCreatedJob;
use App\Jobs\ProductDeletedJob;
use App\Jobs\ProductUpdatedJob;
use App\Models\Product;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ProductController extends Controller
{
    /**
     * Index products method
     *
     * @return \Illuminate\Database\Eloquent\Collection|array
     */
    public function index(): \Illuminate\Database\Eloquent\Collection|array
    {
        return Product::all();
    }

    /**
     * Store product method
     *
     * @param Request $request
     * @return \Illuminate\Http\Response|Application|ResponseFactory
     */
    public function store(Request $request): \Illuminate\Http\Response|Application|ResponseFactory
    {
        $product = Product::create($request->only('title', 'description', 'image', 'price'));

        ProductCreatedJob::dispatch($product->toArray())->onQueue('admin_topic');
        ProductCreatedJob::dispatch($product->toArray())->onQueue('checkout_topic');

        return response($product, Response::HTTP_CREATED);
    }

    /**
     * Show product method
     *
     * @param Product $product
     * @return Product
     */
    public function show(Product $product): Product
    {
        return $product;
    }

    /**
     * Update product method
     *
     * @param Request $request
     * @param Product $product
     * @return \Illuminate\Http\Response|Application|ResponseFactory
     */
    public function update(Request $request, Product $product): \Illuminate\Http\Response|Application|ResponseFactory
    {
        $product->update($request->only('title', 'description', 'image', 'price'));

        ProductUpdatedJob::dispatch($product->toArray())->onQueue('admin_topic');
        ProductUpdatedJob::dispatch($product->toArray())->onQueue('checkout_topic');

        return response($product, Response::HTTP_ACCEPTED);
    }

    /**
     * Destroy product method
     *
     * @param Product $product
     * @return \Illuminate\Http\Response|Application|ResponseFactory
     */
    public function destroy(Product $product): \Illuminate\Http\Response|Application|ResponseFactory
    {
        $product->delete();

        ProductDeletedJob::dispatch(['id' => $product['id']])->onQueue('admin_topic');
        ProductDeletedJob::dispatch(['id' => $product['id']])->onQueue('checkout_topic');

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
