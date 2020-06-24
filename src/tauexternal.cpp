#include<iostream>
#include<cstdio>
#include<vector>
#include<set>
#include<algorithm>

using namespace std;

#define forn(i,n) for(int i =0 ; i < (int)(n);i++)
#define forall(i,c) for(typeof((c).begin()) i = (c).begin();i != (c).end();i++)

typedef double cost;
typedef vector<int> vi;
typedef pair<cost,int> edge;
typedef vector< vector<edge > > Graph;

#define INF 10000.0

vector<cost> dijkstra(Graph & g, int source, int target = -1){
	vector<cost> D(g.size(),INF);
	D[source] = 0;
	set<edge> pq;
	pq.insert(make_pair(D[source],source));
	while(!pq.empty()){
		edge p = *pq.begin();
		int u = p.second;
		pq.erase(pq.begin());
		if(u == target)
			return D;
		forall(it,g[u]){
			cost c = it->first;
			int v = it->second;
			if(D[v] > D[u]+c){
				if(D[v] != INF){
					pq.erase(make_pair(D[v],v));
				}
				D[v] = D[u] + c;
				pq.insert(make_pair(D[v],v));
			}
		}
	}
	return D;
}

Graph read_graph(char* filename){
	int n,m;
	FILE* F = freopen(filename,"r", stdin);
	int ok = 1;
	ok &= scanf("%d", &n);
    Graph g(n);
	ok &= scanf("%d", &m);
	forn(i,m){
		int v,w;
		cost c;
		ok &= scanf("%d",&v);
		ok &= scanf("%d",&w);
		ok &= scanf("%lf",&c);
		edge e = make_pair(c,w-1);
		g[v-1].push_back(e);
	}
	fclose(F);
	if(not (ok==1)) cerr << "Error reading graph"<<endl;
	return g;
}

// the graph obtained from G has vertex set V(G) x {0,..., k}
#define code(v,i,k1) ((k1)*(v)+(i)) // code(v,i,k1) is the number of the vertex (v,i) in the new graph

Graph trick(Graph &g, int k){
	int n = g.size();
	int k1 = k+1;
	vector< vector<edge> > g1 ( k1*n );
	forn(v,n){
		forall(it,g[v]){
			edge e = *it;
			cost c = e.first;
			int w = e.second;
			forn(i,k){
				g1[ code(v,i,k1) ].push_back( make_pair(c, code(w,i+1,k1)));
			}
			g1[ code(v,k,k1) ].push_back( make_pair(c, code(w,k,k1)));
		}
	}
	return g1;
}

cost shortest_cycle(Graph &g, int k){
	// returns the minimum cost of a cycle in g having length at least k
	// (for k=1 this is the girth of g)
	int n = g.size();
	Graph g1 = trick(g, k);
	int k1 = k+1;
	vector<double> girths(n);
	#pragma omp parallel for
	forn(v,n){
		int vs = code(v,0,k1);
		int vt =code(v,k,k1);
		girths[v] = dijkstra(g1,vs,vt)[vt];
	}
	double girth = INF;
	forn(v,n)
		girth = min(girth,girths[v]);
	return girth;
}

int main(int argc, char *argv[]){
	char* filename_in =argv[1];
	char* filename_out =argv[2];
	Graph g = read_graph( filename_in);
	cost girth = shortest_cycle(g, 3);
	FILE * F = freopen(filename_out, "w", stdout);
	cout << girth << endl;
	fclose(F);
	return 0;
}
